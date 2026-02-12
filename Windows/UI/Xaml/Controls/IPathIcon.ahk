#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Media\Geometry.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IPathIcon extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPathIcon
     * @type {Guid}
     */
    static IID => Guid("{214c62db-c366-4a0e-b9ad-dcf168d7ec0c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Data", "put_Data"]

    /**
     * @type {Geometry} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * 
     * @returns {Geometry} 
     */
    get_Data() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geometry(value)
    }

    /**
     * 
     * @param {Geometry} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
