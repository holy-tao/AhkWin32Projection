#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Haptics
 * @version WindowsRuntime 1.4
 */
class IKnownSimpleHapticsControllerWaveformsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownSimpleHapticsControllerWaveformsStatics
     * @type {Guid}
     */
    static IID => Guid("{3d577ef7-4cee-11e6-b535-001bdc06ab3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Click", "get_BuzzContinuous", "get_RumbleContinuous", "get_Press", "get_Release"]

    /**
     * @type {Integer} 
     */
    Click {
        get => this.get_Click()
    }

    /**
     * @type {Integer} 
     */
    BuzzContinuous {
        get => this.get_BuzzContinuous()
    }

    /**
     * @type {Integer} 
     */
    RumbleContinuous {
        get => this.get_RumbleContinuous()
    }

    /**
     * @type {Integer} 
     */
    Press {
        get => this.get_Press()
    }

    /**
     * @type {Integer} 
     */
    Release {
        get => this.get_Release()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Click() {
        result := ComCall(6, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BuzzContinuous() {
        result := ComCall(7, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RumbleContinuous() {
        result := ComCall(8, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Press() {
        result := ComCall(9, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Release() {
        result := ComCall(10, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
