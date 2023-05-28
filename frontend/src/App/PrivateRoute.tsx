import {useEffect} from "react";
import {Navigate, Outlet, useLocation, useNavigate} from "react-router-dom";

export const PrivateRoute = () => {
    const location = useLocation()
    const navigate = useNavigate()

    useEffect(() => {
        if (location.pathname === '/')
            navigate('/login')
    }, [location, navigate])

    const hasUserJWT = localStorage.getItem('token')


    return hasUserJWT ? <Outlet/> : <Navigate to='/login'/>
}