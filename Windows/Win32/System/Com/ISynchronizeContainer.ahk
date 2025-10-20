#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Manages a group of unsignaled synchronization objects.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-isynchronizecontainer
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISynchronizeContainer extends IUnknown{
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
     * 
     * @param {Pointer<ISynchronize>} pSync 
     * @returns {HRESULT} 
     */
    AddSynchronize(pSync) {
        result := ComCall(3, this, "ptr", pSync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} dwTimeOut 
     * @param {Pointer<ISynchronize>} ppSync 
     * @returns {HRESULT} 
     */
    WaitMultiple(dwFlags, dwTimeOut, ppSync) {
        result := ComCall(4, this, "uint", dwFlags, "uint", dwTimeOut, "ptr", ppSync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
