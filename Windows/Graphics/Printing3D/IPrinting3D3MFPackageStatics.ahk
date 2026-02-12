#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\Printing3D3MFPackage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3D3MFPackageStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3D3MFPackageStatics
     * @type {Guid}
     */
    static IID => Guid("{7058d9af-7a9a-4787-b817-f6f459214823}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadAsync"]

    /**
     * 
     * @param {IRandomAccessStream} value 
     * @returns {IAsyncOperation<Printing3D3MFPackage>} 
     */
    LoadAsync(value) {
        result := ComCall(6, this, "ptr", value, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Printing3D3MFPackage, operation)
    }
}
