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
     * 
     * @param {Integer} Type 
     * @param {Integer} dwIndex 
     * @param {Pointer<Guid>} guidService 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObjects 
     * @param {Pointer<Integer>} pnObjects 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imftopologyservicelookup-lookupservice
     */
    LookupService(Type, dwIndex, guidService, riid, ppvObjects, pnObjects) {
        ppvObjectsMarshal := ppvObjects is VarRef ? "ptr*" : "ptr"
        pnObjectsMarshal := pnObjects is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "int", Type, "uint", dwIndex, "ptr", guidService, "ptr", riid, ppvObjectsMarshal, ppvObjects, pnObjectsMarshal, pnObjects, "HRESULT")
        return result
    }
}
