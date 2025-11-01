#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later. The IAttributeSet interface sets key/value pairs on an object, where the key is a GUID and the value is any binary data.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAttributeSet)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dsattrib/nn-dsattrib-iattributeset
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IAttributeSet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAttributeSet
     * @type {Guid}
     */
    static IID => Guid("{583ec3cc-4960-4857-982b-41a33ea0a006}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAttrib"]

    /**
     * 
     * @param {Guid} guidAttribute 
     * @param {Pointer<Integer>} pbAttribute 
     * @param {Integer} dwAttributeLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dsattrib/nf-dsattrib-iattributeset-setattrib
     */
    SetAttrib(guidAttribute, pbAttribute, dwAttributeLength) {
        pbAttributeMarshal := pbAttribute is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", guidAttribute, pbAttributeMarshal, pbAttribute, "uint", dwAttributeLength, "HRESULT")
        return result
    }
}
