#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumStreamBufferRecordingAttrib.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAttribute", "GetAttributeCount", "GetAttributeByName", "GetAttributeByIndex", "EnumAttributes"]

    /**
     * 
     * @param {Integer} ulReserved 
     * @param {PWSTR} pszAttributeName 
     * @param {Integer} StreamBufferAttributeType 
     * @param {Pointer<Integer>} pbAttribute 
     * @param {Integer} cbAttributeLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferrecordingattribute-setattribute
     */
    SetAttribute(ulReserved, pszAttributeName, StreamBufferAttributeType, pbAttribute, cbAttributeLength) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        pbAttributeMarshal := pbAttribute is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", ulReserved, "ptr", pszAttributeName, "int", StreamBufferAttributeType, pbAttributeMarshal, pbAttribute, "ushort", cbAttributeLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulReserved 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferrecordingattribute-getattributecount
     */
    GetAttributeCount(ulReserved) {
        result := ComCall(4, this, "uint", ulReserved, "ushort*", &pcAttributes := 0, "HRESULT")
        return pcAttributes
    }

    /**
     * 
     * @param {PWSTR} pszAttributeName 
     * @param {Pointer<Integer>} pulReserved 
     * @param {Pointer<Integer>} pStreamBufferAttributeType 
     * @param {Pointer<Integer>} pbAttribute 
     * @param {Pointer<Integer>} pcbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferrecordingattribute-getattributebyname
     */
    GetAttributeByName(pszAttributeName, pulReserved, pStreamBufferAttributeType, pbAttribute, pcbLength) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        pulReservedMarshal := pulReserved is VarRef ? "uint*" : "ptr"
        pStreamBufferAttributeTypeMarshal := pStreamBufferAttributeType is VarRef ? "int*" : "ptr"
        pbAttributeMarshal := pbAttribute is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(5, this, "ptr", pszAttributeName, pulReservedMarshal, pulReserved, pStreamBufferAttributeTypeMarshal, pStreamBufferAttributeType, pbAttributeMarshal, pbAttribute, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wIndex 
     * @param {Pointer<Integer>} pulReserved 
     * @param {PWSTR} pszAttributeName 
     * @param {Pointer<Integer>} pcchNameLength 
     * @param {Pointer<Integer>} pStreamBufferAttributeType 
     * @param {Pointer<Integer>} pbAttribute 
     * @param {Pointer<Integer>} pcbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferrecordingattribute-getattributebyindex
     */
    GetAttributeByIndex(wIndex, pulReserved, pszAttributeName, pcchNameLength, pStreamBufferAttributeType, pbAttribute, pcbLength) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        pulReservedMarshal := pulReserved is VarRef ? "uint*" : "ptr"
        pcchNameLengthMarshal := pcchNameLength is VarRef ? "ushort*" : "ptr"
        pStreamBufferAttributeTypeMarshal := pStreamBufferAttributeType is VarRef ? "int*" : "ptr"
        pbAttributeMarshal := pbAttribute is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, "ushort", wIndex, pulReservedMarshal, pulReserved, "ptr", pszAttributeName, pcchNameLengthMarshal, pcchNameLength, pStreamBufferAttributeTypeMarshal, pStreamBufferAttributeType, pbAttributeMarshal, pbAttribute, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumStreamBufferRecordingAttrib} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferrecordingattribute-enumattributes
     */
    EnumAttributes() {
        result := ComCall(7, this, "ptr*", &ppIEnumStreamBufferAttrib := 0, "HRESULT")
        return IEnumStreamBufferRecordingAttrib(ppIEnumStreamBufferAttrib)
    }
}
