#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources.Management
 * @version WindowsRuntime 1.4
 */
class IIndexedResourceQualifier extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIndexedResourceQualifier
     * @type {Guid}
     */
    static IID => Guid("{dae3bb9b-d304-497f-a168-a340042c8adb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_QualifierName", "get_QualifierValue"]

    /**
     * @type {HSTRING} 
     */
    QualifierName {
        get => this.get_QualifierName()
    }

    /**
     * @type {HSTRING} 
     */
    QualifierValue {
        get => this.get_QualifierValue()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QualifierName() {
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
    get_QualifierValue() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
