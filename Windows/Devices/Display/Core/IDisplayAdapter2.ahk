#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DisplayAdapter.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayAdapter2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayAdapter2
     * @type {Guid}
     */
    static IID => Guid("{9ab49b18-b3c7-5546-8374-a9127111edd8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsIndirectDisplayDevice", "get_PreferredRenderAdapter"]

    /**
     * @type {Boolean} 
     */
    IsIndirectDisplayDevice {
        get => this.get_IsIndirectDisplayDevice()
    }

    /**
     * @type {DisplayAdapter} 
     */
    PreferredRenderAdapter {
        get => this.get_PreferredRenderAdapter()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIndirectDisplayDevice() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DisplayAdapter} 
     */
    get_PreferredRenderAdapter() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayAdapter(value)
    }
}
