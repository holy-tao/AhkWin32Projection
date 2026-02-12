#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CapturedFrameControlValues.ahk
#Include ..\..\Graphics\Imaging\BitmapPropertySet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class ICapturedFrame2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICapturedFrame2
     * @type {Guid}
     */
    static IID => Guid("{543fa6d1-bd78-4866-adda-24314bc65dea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ControlValues", "get_BitmapProperties"]

    /**
     * @type {CapturedFrameControlValues} 
     */
    ControlValues {
        get => this.get_ControlValues()
    }

    /**
     * @type {BitmapPropertySet} 
     */
    BitmapProperties {
        get => this.get_BitmapProperties()
    }

    /**
     * 
     * @returns {CapturedFrameControlValues} 
     */
    get_ControlValues() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CapturedFrameControlValues(value)
    }

    /**
     * 
     * @returns {BitmapPropertySet} 
     */
    get_BitmapProperties() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BitmapPropertySet(value)
    }
}
