#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Printing3D3MFPackage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrint3DTaskSourceChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrint3DTaskSourceChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{5bcd34af-24e9-4c10-8d07-14c346ba3fcf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Source"]

    /**
     * @type {Printing3D3MFPackage} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * 
     * @returns {Printing3D3MFPackage} 
     */
    get_Source() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Printing3D3MFPackage(value)
    }
}
