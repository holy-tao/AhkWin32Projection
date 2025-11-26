#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPErrorItem.ahk

/**
 * The IWMPErrorItem2 interface provides a method that supplements the IWMPErrorItem interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmperroritem2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPErrorItem2 extends IWMPErrorItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPErrorItem2
     * @type {Guid}
     */
    static IID => Guid("{f75ccec0-c67c-475c-931e-8719870bee7d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_condition"]

    /**
     */
    condition {
        get => this.get_condition()
    }

    /**
     * 
     * @param {Pointer<Integer>} plCondition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmperroritem2-get_condition
     */
    get_condition(plCondition) {
        plConditionMarshal := plCondition is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, plConditionMarshal, plCondition, "HRESULT")
        return result
    }
}
