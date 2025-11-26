#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables a custom video mixer or video presenter to get interface pointers from the Enhanced Video Renderer (EVR).
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-imftopologyservicelookup
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTopologyServiceLookup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTopologyServiceLookup
     * @type {Guid}
     */
    static IID => Guid("{fa993889-4383-415a-a930-dd472a8cf6f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LookupService"]

    /**
     * Retrieves an interface from the enhanced video renderer (EVR), or from the video mixer or video presenter.
     * @param {Integer} Type Specifies the scope of the search. Currently this parameter is ignored. Use the value MF_SERVICE_LOOKUP_GLOBAL.
     * @param {Integer} dwIndex Reserved, must be zero.
     * @param {Pointer<Guid>} guidService Service GUID of the requested interface.
     * @param {Pointer<Guid>} riid Interface identifier of the requested interface.
     * @param {Pointer<Integer>} pnObjects Pointer to a value that specifies the size of the <i>ppvObjects</i> array. The value must be at least 1. In the current implementation, there is no reason to specify an array size larger than one element. The value is not changed on output.
     * @returns {Pointer<Void>} Array of interface pointers. If the method succeeds, each member of the array contains either a valid interface pointer or <b>NULL</b>. The caller must release the interface pointers when the EVR calls <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imftopologyservicelookupclient-releaseservicepointers">IMFTopologyServiceLookupClient::ReleaseServicePointers</a> (or earlier). If the method fails, every member of the array is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imftopologyservicelookup-lookupservice
     */
    LookupService(Type, dwIndex, guidService, riid, pnObjects) {
        pnObjectsMarshal := pnObjects is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "int", Type, "uint", dwIndex, "ptr", guidService, "ptr", riid, "ptr*", &ppvObjects := 0, pnObjectsMarshal, pnObjects, "HRESULT")
        return ppvObjects
    }
}
