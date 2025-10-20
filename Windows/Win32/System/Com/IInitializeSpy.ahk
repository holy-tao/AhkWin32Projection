#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Performs initialization or cleanup when entering or exiting a COM apartment.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iinitializespy
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IInitializeSpy extends IUnknown{
    /**
     * The interface identifier for IInitializeSpy
     * @type {Guid}
     */
    static IID => Guid("{00000034-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwCoInit 
     * @param {Integer} dwCurThreadAptRefs 
     * @returns {HRESULT} 
     */
    PreInitialize(dwCoInit, dwCurThreadAptRefs) {
        result := ComCall(3, this, "uint", dwCoInit, "uint", dwCurThreadAptRefs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hrCoInit 
     * @param {Integer} dwCoInit 
     * @param {Integer} dwNewThreadAptRefs 
     * @returns {HRESULT} 
     */
    PostInitialize(hrCoInit, dwCoInit, dwNewThreadAptRefs) {
        result := ComCall(4, this, "int", hrCoInit, "uint", dwCoInit, "uint", dwNewThreadAptRefs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCurThreadAptRefs 
     * @returns {HRESULT} 
     */
    PreUninitialize(dwCurThreadAptRefs) {
        result := ComCall(5, this, "uint", dwCurThreadAptRefs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwNewThreadAptRefs 
     * @returns {HRESULT} 
     */
    PostUninitialize(dwNewThreadAptRefs) {
        result := ComCall(6, this, "uint", dwNewThreadAptRefs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
