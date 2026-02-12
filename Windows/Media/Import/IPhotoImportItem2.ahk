#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class IPhotoImportItem2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoImportItem2
     * @type {Guid}
     */
    static IID => Guid("{f1053505-f53b-46a3-9e30-3610791a9110}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Path"]

    /**
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Path() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
