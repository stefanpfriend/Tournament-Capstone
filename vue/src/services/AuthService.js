import axios from 'axios';
const http = axios.create({
  baseURL: "http://localhost:3000"
});
export default {
  login(user) {
    return axios.post('/login', user)
  },
  register(user) {
    return axios.post('/register', user)
  }
}