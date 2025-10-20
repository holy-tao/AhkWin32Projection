#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBufferRecordingAttribute interface sets and retrieves attributes on a stream buffer recording.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferRecordingAttribute)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambufferrecordingattribute
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferRecordingAttribute extends IUnknown{
    /**
     * The interface identifier for IStreamBufferRecordingAttribute
     * @type {Guid}
     */
    static IID => Guid("{16ca4e03-fe69-4705-bd41-5b7dfc0c95f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} ulReserved 
     * @param {PWSTR} pszAttributeName 
     * @param {Integer} StreamBufferAttributeType 
     * @param {Pointer<Byte>} pbAttribute 
     * @param {Integer} cbAttributeLength 
     * @returns {HRESULT} 
     */
    SetAttribute(ulReserved, pszAttributeName, StreamBufferAttributeType, pbAttribute, cbAttributeLength) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        result := ComCall(3, this, "uint", ulReserved, "ptr", pszAttributeName, "int", StreamBufferAttributeType, "char*", pbAttribute, "ushort", cbAttributeLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulReserved 
     * @param {Pointer<UInt16>} pcAttributes 
     * @returns {HRESULT} 
     */
    GetAttributeCount(ulReserved, pcAttributes) {
        result := ComCall(4, this, "uint", ulReserved, "ushort*", pcAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszAttributeName 
     * @param {Pointer<UInt32>} pulReserved 
     * @param {Pointer<Int32>} pStreamBufferAttributeType 
     * @param {Pointer<Byte>} pbAttribute 
     * @param {Pointer<UInt16>} pcbLength 
     * @returns {HRESULT} 
     */
    GetAttributeByName(pszAttributeName, pulReserved, pStreamBufferAttributeType, pbAttribute, pcbLength) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        result := ComCall(5, this, "ptr", pszAttributeName, "uint*", pulReserved, "int*", pStreamBufferAttributeType, "char*", pbAttribute, "ushort*", pcbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @param {Pointer<UInt32>} pulReserved 
     * @param {PWSTR} pszAttributeName 
     * @param {Pointer<UInt16>} pcchNameLength 
     * @param {Pointer<Int32>} pStreamBufferAttributeType 
     * @param {Pointer<Byte>} pbAttribute 
     * @param {Pointer<UInt16>} pcbLength 
     * @returns {HRESULT} 
     */
    GetAttributeByIndex(wIndex, pulReserved, pszAttributeName, pcchNameLength, pStreamBufferAttributeType, pbAttribute, pcbLength) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        result := ComCall(6, this, "ushort", wIndex, "uint*", pulReserved, "ptr", pszAttributeName, "ushort*", pcchNameLength, "int*", pStreamBufferAttributeType, "char*", pbAttribute, "ushort*", pcbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumStreamBufferRecordingAttrib>} ppIEnumStreamBufferAttrib 
     * @returns {HRESULT} 
     */
    EnumAttributes(ppIEnumStreamBufferAttrib) {
        result := ComCall(7, this, "ptr", ppIEnumStreamBufferAttrib, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
