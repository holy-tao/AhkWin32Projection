#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_RECORDA.ahk" { DNS_RECORDA }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_QUERY_RAW_RESULT {
    #StructPack 8

    version : UInt32

    queryStatus : Int32

    queryOptions : Int64

    queryRawOptions : Int64

    responseFlags : Int64

    queryRawResponseSize : UInt32

    queryRawResponse : IntPtr

    queryRecords : DNS_RECORDA.Ptr

    protocol : UInt32

    maxSa : CHAR[32]

}
