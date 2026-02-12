#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class ISystemIdentificationInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemIdentificationInfo
     * @type {Guid}
     */
    static IID => Guid("{0c659e7d-c3c2-4d33-a2df-21bc41916eb3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_Source"]

    /**
     * @type {IBuffer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Integer} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Id() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Source() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
