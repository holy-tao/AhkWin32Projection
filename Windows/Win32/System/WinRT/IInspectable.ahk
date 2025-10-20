#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides functionality required for all Windows Runtime classes.
 * @remarks
 * 
  * <b>IInspectable</b> methods have no effect on COM apartments and are safe to call from user interface threads.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//inspectable/nn-inspectable-iinspectable
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IInspectable extends IUnknown{
    /**
     * The interface identifier for IInspectable
     * @type {Guid}
     */
    static IID => Guid("{af86e2e0-b12d-4c6a-9c5a-d7aa65101e90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} iidCount 
     * @param {Pointer<Guid>} iids 
     * @returns {HRESULT} 
     */
    GetIids(iidCount, iids) {
        result := ComCall(3, this, "uint*", iidCount, "ptr", iids, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HSTRING>} className 
     * @returns {HRESULT} 
     */
    GetRuntimeClassName(className) {
        result := ComCall(4, this, "ptr", className, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} trustLevel 
     * @returns {HRESULT} 
     */
    GetTrustLevel(trustLevel) {
        result := ComCall(5, this, "int*", trustLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
