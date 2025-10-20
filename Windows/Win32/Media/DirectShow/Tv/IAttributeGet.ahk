#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later. The IAttributeGet interface gets key/value pairs from an object, where the key is a GUID and the value is any binary data.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAttributeGet)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dsattrib/nn-dsattrib-iattributeget
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IAttributeGet extends IUnknown{
    /**
     * The interface identifier for IAttributeGet
     * @type {Guid}
     */
    static IID => Guid("{52dbd1ec-e48f-4528-9232-f442a68f0ae1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    GetCount(plCount) {
        result := ComCall(3, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<Guid>} pguidAttribute 
     * @param {Pointer<Byte>} pbAttribute 
     * @param {Pointer<UInt32>} pdwAttributeLength 
     * @returns {HRESULT} 
     */
    GetAttribIndexed(lIndex, pguidAttribute, pbAttribute, pdwAttributeLength) {
        result := ComCall(4, this, "int", lIndex, "ptr", pguidAttribute, "char*", pbAttribute, "uint*", pdwAttributeLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidAttribute 
     * @param {Pointer<Byte>} pbAttribute 
     * @param {Pointer<UInt32>} pdwAttributeLength 
     * @returns {HRESULT} 
     */
    GetAttrib(guidAttribute, pbAttribute, pdwAttributeLength) {
        result := ComCall(5, this, "ptr", guidAttribute, "char*", pbAttribute, "uint*", pdwAttributeLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
