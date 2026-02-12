#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioNodeEmitterConeProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioNodeEmitterConeProperties
     * @type {Guid}
     */
    static IID => Guid("{e99b2cee-02ca-4375-9326-0c6ae4bcdfb5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InnerAngle", "get_OuterAngle", "get_OuterAngleGain"]

    /**
     * @type {Float} 
     */
    InnerAngle {
        get => this.get_InnerAngle()
    }

    /**
     * @type {Float} 
     */
    OuterAngle {
        get => this.get_OuterAngle()
    }

    /**
     * @type {Float} 
     */
    OuterAngleGain {
        get => this.get_OuterAngleGain()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InnerAngle() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OuterAngle() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OuterAngleGain() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
