#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISynchronize.ahk
#Include .\IUnknown.ahk

/**
 * Manages a group of unsignaled synchronization objects.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-isynchronizecontainer
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISynchronizeContainer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISynchronizeContainer
     * @type {Guid}
     */
    static IID => Guid("{00000033-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddSynchronize", "WaitMultiple"]

    /**
     * 
     * @param {ISynchronize} pSync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-isynchronizecontainer-addsynchronize
     */
    AddSynchronize(pSync) {
        result := ComCall(3, this, "ptr", pSync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} dwTimeOut 
     * @returns {ISynchronize} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-isynchronizecontainer-waitmultiple
     */
    WaitMultiple(dwFlags, dwTimeOut) {
        result := ComCall(4, this, "uint", dwFlags, "uint", dwTimeOut, "ptr*", &ppSync := 0, "HRESULT")
        return ISynchronize(ppSync)
    }
}
