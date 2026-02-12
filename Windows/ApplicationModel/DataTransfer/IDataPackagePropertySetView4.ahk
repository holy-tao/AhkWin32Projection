#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IDataPackagePropertySetView4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataPackagePropertySetView4
     * @type {Guid}
     */
    static IID => Guid("{4474c80d-d16f-40ae-9580-6f8562b94235}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentSourceUserActivityJson"]

    /**
     * @type {HSTRING} 
     */
    ContentSourceUserActivityJson {
        get => this.get_ContentSourceUserActivityJson()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentSourceUserActivityJson() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
