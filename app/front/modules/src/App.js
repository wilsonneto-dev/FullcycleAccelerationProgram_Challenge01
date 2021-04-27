import axios from 'axios';
import { useEffect, useState } from 'react';
import styles from './styles.module.css';

function App() {
  const [modules, setModules] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const { data } = axios.get("/api/modules").then(({data}) => {
      setModules(data.modules);
      setLoading(false);  
    });
  }, [])

  return (
    <div className="App">
      <header className="App-header">
        <h1>Modules</h1>
      </header>

      { loading && "loading..." }

      <ul>
        {
          modules.map((item, index) => (
            <li key={index}>{item.id} - <b>{ item.title }</b></li>)
          )
        }
      </ul>
    </div>
  );
}

export default App;
