import axios from "axios";
import { apiBaseUrl } from "./constants";

const Api = axios.create({
    baseURL: apiBaseUrl,
    withCredentials: true
});

export default Api;