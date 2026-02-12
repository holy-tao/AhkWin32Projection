#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DBaseMaterialStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DBaseMaterialStatics
     * @type {Guid}
     */
    static IID => Guid("{815a47bc-374a-476d-be92-3ecfd1cb9776}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Abs", "get_Pla"]

    /**
     * @type {HSTRING} 
     */
    Abs {
        get => this.get_Abs()
    }

    /**
     * @type {HSTRING} 
     */
    Pla {
        get => this.get_Pla()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Abs() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Pla() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
