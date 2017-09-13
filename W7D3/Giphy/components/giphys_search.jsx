import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {searchTerm:""};
    this.handleInput = this.handleInput.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInput(e) {
    this.setState({searchTerm: e.currentTarget.value});
  }

  handleSubmit(e){
    e.preventDefault();
    this.props.fetchSearchGiphys( this.state.searchTerm.split(' ').join('+') );

    this.setState({searchTerm: ""});

  }

  render() {
    return (
      <div>
        <input value={this.state.searchTerm} onChange={this.handleInput}/>
        <button type="submit" onClick={this.handleSubmit}> search </button>

        <GiphysIndex giphys={this.props.giphys}/>
      </div>
    );
  }
}

export default GiphysSearch;
