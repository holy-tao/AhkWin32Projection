#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrint3DTaskSourceRequestedArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrint3DTaskSourceRequestedArgs
     * @type {Guid}
     */
    static IID => Guid("{c77c9aba-24af-424d-a3bf-92250c355602}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSource"]

    /**
     * 
     * @param {Printing3D3MFPackage} source 
     * @returns {HRESULT} 
     */
    SetSource(source) {
        result := ComCall(6, this, "ptr", source, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
