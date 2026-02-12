#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayTaskResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayTaskResult
     * @type {Guid}
     */
    static IID => Guid("{6fbc7d67-f9b1-55e0-9d88-d3a5197a3f59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PresentStatus", "get_PresentId", "get_SourceStatus"]

    /**
     * @type {Integer} 
     */
    PresentStatus {
        get => this.get_PresentStatus()
    }

    /**
     * @type {Integer} 
     */
    PresentId {
        get => this.get_PresentId()
    }

    /**
     * @type {Integer} 
     */
    SourceStatus {
        get => this.get_SourceStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PresentStatus() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PresentId() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SourceStatus() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
