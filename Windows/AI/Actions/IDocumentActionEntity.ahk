#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IDocumentActionEntity extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDocumentActionEntity
     * @type {Guid}
     */
    static IID => Guid("{56715297-960b-59ff-af4b-ece1098b2e36}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FullPath"]

    /**
     * @type {HSTRING} 
     */
    FullPath {
        get => this.get_FullPath()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FullPath() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
