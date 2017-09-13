import React from 'react';

import GiphysIndexItem from './giphys_index_item';

class GiphysIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const allItems = this.props.giphys.map(giphy=><GiphysIndexItem giphy={giphy}/>);
    return (
      <ul>
        {allItems}
      </ul>
    );
  }
}

export default GiphysIndex;
