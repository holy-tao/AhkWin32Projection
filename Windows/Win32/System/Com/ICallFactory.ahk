#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Creates a call object for processing calls to the methods of an asynchronous interface.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-icallfactory
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ICallFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICallFactory
     * @type {Guid}
     */
    static IID => Guid("{1c733a30-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCall"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} pCtrlUnk 
     * @param {Pointer<Guid>} riid2 
     * @param {Pointer<IUnknown>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-icallfactory-createcall
     */
    CreateCall(riid, pCtrlUnk, riid2, ppv) {
        result := ComCall(3, this, "ptr", riid, "ptr", pCtrlUnk, "ptr", riid2, "ptr*", ppv, "HRESULT")
        return result
    }
}
