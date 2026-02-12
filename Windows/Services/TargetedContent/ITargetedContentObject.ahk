#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TargetedContentCollection.ahk
#Include .\TargetedContentItem.ahk
#Include .\TargetedContentValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class ITargetedContentObject extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITargetedContentObject
     * @type {Guid}
     */
    static IID => Guid("{041d7969-2212-42d1-9dfa-88a8e3033aa3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ObjectKind", "get_Collection", "get_Item", "get_Value"]

    /**
     * @type {Integer} 
     */
    ObjectKind {
        get => this.get_ObjectKind()
    }

    /**
     * @type {TargetedContentCollection} 
     */
    Collection {
        get => this.get_Collection()
    }

    /**
     * @type {TargetedContentItem} 
     */
    Item {
        get => this.get_Item()
    }

    /**
     * @type {TargetedContentValue} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ObjectKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TargetedContentCollection} 
     */
    get_Collection() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TargetedContentCollection(value)
    }

    /**
     * 
     * @returns {TargetedContentItem} 
     */
    get_Item() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TargetedContentItem(value)
    }

    /**
     * 
     * @returns {TargetedContentValue} 
     */
    get_Value() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TargetedContentValue(value)
    }
}
