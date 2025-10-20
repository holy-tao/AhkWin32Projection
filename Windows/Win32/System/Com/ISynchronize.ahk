#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Provides asynchronous communication between objects about the occurrence of an event.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-isynchronize
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISynchronize extends IUnknown{
    /**
     * The interface identifier for ISynchronize
     * @type {Guid}
     */
    static IID => Guid("{00000030-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} dwMilliseconds 
     * @returns {HRESULT} 
     */
    Wait(dwFlags, dwMilliseconds) {
        result := ComCall(3, this, "uint", dwFlags, "uint", dwMilliseconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Signal() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
