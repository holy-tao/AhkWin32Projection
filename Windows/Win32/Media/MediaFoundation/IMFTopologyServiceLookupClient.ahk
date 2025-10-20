#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Initializes a video mixer or presenter.
 * @remarks
 * 
  * When the EVR loads the video mixer and the video presenter, the EVR queries the object for this interface and calls <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imftopologyservicelookupclient-initservicepointers">InitServicePointers</a>. Inside the <b>InitServicePointers</b> method, the object can query the EVR for interface pointers.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-imftopologyservicelookupclient
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTopologyServiceLookupClient extends IUnknown{
    /**
     * The interface identifier for IMFTopologyServiceLookupClient
     * @type {Guid}
     */
    static IID => Guid("{fa99388a-4383-415a-a930-dd472a8cf6f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFTopologyServiceLookup>} pLookup 
     * @returns {HRESULT} 
     */
    InitServicePointers(pLookup) {
        result := ComCall(3, this, "ptr", pLookup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReleaseServicePointers() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
