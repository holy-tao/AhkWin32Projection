#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class IFrameExposureCompensationControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameExposureCompensationControl
     * @type {Guid}
     */
    static IID => Guid("{e95896c9-f7f9-48ca-8591-a26531cb1578}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Value", "put_Value"]

    /**
     * @type {IReference<Float>} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_Value() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetSingle(), value)
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
