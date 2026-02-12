#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class IGuidanceRoadSegment2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuidanceRoadSegment2
     * @type {Guid}
     */
    static IID => Guid("{2474a61d-1723-49f1-895b-47a2c4aa9c55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsScenic"]

    /**
     * @type {Boolean} 
     */
    IsScenic {
        get => this.get_IsScenic()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScenic() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
