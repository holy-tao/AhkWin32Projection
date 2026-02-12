#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Foundation\Collections\ValueSet.ahk
#Include ..\..\..\Foundation\IMemoryBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents an object that can produce PerceptionFrames.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.iperceptionframeprovider
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class IPerceptionFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionFrame
     * @type {Guid}
     */
    static IID => Guid("{7cfe7825-54bb-4d9d-bec5-8ef66151d2ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RelativeTime", "put_RelativeTime", "get_Properties", "get_FrameData"]

    /**
     * @type {TimeSpan} 
     */
    RelativeTime {
        get => this.get_RelativeTime()
        set => this.put_RelativeTime(value)
    }

    /**
     * @type {ValueSet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {IMemoryBuffer} 
     */
    FrameData {
        get => this.get_FrameData()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_RelativeTime() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_RelativeTime(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Properties() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValueSet(value)
    }

    /**
     * 
     * @returns {IMemoryBuffer} 
     */
    get_FrameData() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMemoryBuffer(value)
    }
}
