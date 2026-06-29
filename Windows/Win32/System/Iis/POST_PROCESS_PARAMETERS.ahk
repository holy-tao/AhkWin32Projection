#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct POST_PROCESS_PARAMETERS {
    #StructPack 8

    pszSessionId : PWSTR

    pszSiteName : PWSTR

    pszUserName : PWSTR

    pszHostName : PWSTR

    pszRemoteIpAddress : PWSTR

    dwRemoteIpPort : UInt32

    pszLocalIpAddress : PWSTR

    dwLocalIpPort : UInt32

    BytesSent : Int64

    BytesReceived : Int64

    pszCommand : PWSTR

    pszCommandParameters : PWSTR

    pszFullPath : PWSTR

    pszPhysicalPath : PWSTR

    FtpStatus : UInt32

    FtpSubStatus : UInt32

    hrStatus : HRESULT

    SessionStartTime : FILETIME

    BytesSentPerSession : Int64

    BytesReceivedPerSession : Int64

}
