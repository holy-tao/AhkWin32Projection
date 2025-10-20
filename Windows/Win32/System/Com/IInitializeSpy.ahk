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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PreInitialize", "PostInitialize", "PreUninitialize", "PostUninitialize"]

    /**
     * 
     * @param {Integer} dwCoInit 
     * @param {Integer} dwCurThreadAptRefs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iinitializespy-preinitialize
     */
    PreInitialize(dwCoInit, dwCurThreadAptRefs) {
        result := ComCall(3, this, "uint", dwCoInit, "uint", dwCurThreadAptRefs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrCoInit 
     * @param {Integer} dwCoInit 
     * @param {Integer} dwNewThreadAptRefs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iinitializespy-postinitialize
     */
    PostInitialize(hrCoInit, dwCoInit, dwNewThreadAptRefs) {
        result := ComCall(4, this, "int", hrCoInit, "uint", dwCoInit, "uint", dwNewThreadAptRefs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCurThreadAptRefs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iinitializespy-preuninitialize
     */
    PreUninitialize(dwCurThreadAptRefs) {
        result := ComCall(5, this, "uint", dwCurThreadAptRefs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwNewThreadAptRefs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iinitializespy-postuninitialize
     */
    PostUninitialize(dwNewThreadAptRefs) {
        result := ComCall(6, this, "uint", dwNewThreadAptRefs, "HRESULT")
        return result
    }
}
