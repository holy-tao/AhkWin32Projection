#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IAdviseSink.ahk" { IAdviseSink }
#Import ".\DVTARGETDEVICE.ahk" { DVTARGETDEVICE }
#Import ".\FORMATETC.ahk" { FORMATETC }

/**
 * Contains information used to specify each advisory connection.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-statdata
 * @namespace Windows.Win32.System.Com
 */
export default struct STATDATA {
    #StructPack 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structure for the data of interest to the advise sink. The advise sink receives notification of changes to the data specified by this <b>FORMATETC</b> structure.
     */
    formatetc : FORMATETC

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-advf">ADVF</a> enumeration value that determines when the advisory sink is notified of changes in the data.
     */
    advf : UInt32

    /**
     * The pointer for the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iadvisesink">IAdviseSink</a> interface that will receive change notifications.
     */
    pAdvSink : IAdviseSink

    /**
     * The token that uniquely identifies the advisory connection. This token is returned by the method that sets up the advisory connection.
     */
    dwConnection : UInt32

}
