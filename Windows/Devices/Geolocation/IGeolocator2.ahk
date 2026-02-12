#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeolocator2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeolocator2
     * @type {Guid}
     */
    static IID => Guid("{d1b42e6d-8891-43b4-ad36-27c6fe9a97b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AllowFallbackToConsentlessPositions"]

    /**
     * 
     * @returns {HRESULT} 
     */
    AllowFallbackToConsentlessPositions() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
