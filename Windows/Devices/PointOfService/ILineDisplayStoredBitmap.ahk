#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ILineDisplayStoredBitmap extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILineDisplayStoredBitmap
     * @type {Guid}
     */
    static IID => Guid("{f621515b-d81e-43ba-bf1b-bcfa3c785ba0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EscapeSequence", "TryDeleteAsync"]

    /**
     * @type {HSTRING} 
     */
    EscapeSequence {
        get => this.get_EscapeSequence()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EscapeSequence() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryDeleteAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
