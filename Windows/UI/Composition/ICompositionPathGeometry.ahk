#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionPath.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionPathGeometry extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionPathGeometry
     * @type {Guid}
     */
    static IID => Guid("{0b6a417e-2c77-4c23-af5e-6304c147bb61}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Path", "put_Path"]

    /**
     * @type {CompositionPath} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * 
     * @returns {CompositionPath} 
     */
    get_Path() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionPath(value)
    }

    /**
     * 
     * @param {CompositionPath} value 
     * @returns {HRESULT} 
     */
    put_Path(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
