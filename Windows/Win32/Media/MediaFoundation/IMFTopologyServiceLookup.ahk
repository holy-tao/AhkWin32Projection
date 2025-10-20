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
     * 
     * @param {Integer} Type 
     * @param {Integer} dwIndex 
     * @param {Pointer<Guid>} guidService 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObjects 
     * @param {Pointer<UInt32>} pnObjects 
     * @returns {HRESULT} 
     */
    LookupService(Type, dwIndex, guidService, riid, ppvObjects, pnObjects) {
        result := ComCall(3, this, "int", Type, "uint", dwIndex, "ptr", guidService, "ptr", riid, "ptr", ppvObjects, "uint*", pnObjects, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
