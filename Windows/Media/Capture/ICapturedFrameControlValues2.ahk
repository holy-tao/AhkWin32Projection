#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\MediaProperties\MediaRatio.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class ICapturedFrameControlValues2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICapturedFrameControlValues2
     * @type {Guid}
     */
    static IID => Guid("{500b2b88-06d2-4aa7-a7db-d37af73321d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FocusState", "get_IsoDigitalGain", "get_IsoAnalogGain", "get_SensorFrameRate", "get_WhiteBalanceGain"]

    /**
     * @type {IReference<Integer>} 
     */
    FocusState {
        get => this.get_FocusState()
    }

    /**
     * @type {IReference<Float>} 
     */
    IsoDigitalGain {
        get => this.get_IsoDigitalGain()
    }

    /**
     * @type {IReference<Float>} 
     */
    IsoAnalogGain {
        get => this.get_IsoAnalogGain()
    }

    /**
     * @type {MediaRatio} 
     */
    SensorFrameRate {
        get => this.get_SensorFrameRate()
    }

    /**
     * @type {IReference<WhiteBalanceGain>} 
     */
    WhiteBalanceGain {
        get => this.get_WhiteBalanceGain()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_FocusState() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_IsoDigitalGain() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_IsoAnalogGain() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @returns {MediaRatio} 
     */
    get_SensorFrameRate() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaRatio(value)
    }

    /**
     * 
     * @returns {IReference<WhiteBalanceGain>} 
     */
    get_WhiteBalanceGain() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetWhiteBalanceGain(), value)
    }
}
