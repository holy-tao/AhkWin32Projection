#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioGraphSettings2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioGraphSettings2
     * @type {Guid}
     */
    static IID => Guid("{72919787-4dab-46e3-b4c9-d8e1a2636062}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_MaxPlaybackSpeedFactor", "get_MaxPlaybackSpeedFactor"]

    /**
     * @type {Float} 
     */
    MaxPlaybackSpeedFactor {
        get => this.get_MaxPlaybackSpeedFactor()
        set => this.put_MaxPlaybackSpeedFactor(value)
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxPlaybackSpeedFactor(value) {
        result := ComCall(6, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxPlaybackSpeedFactor() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
