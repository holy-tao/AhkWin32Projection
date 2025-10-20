#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IProvideClassInfo2.ahk

/**
 * An extension to IProvideClassInfo2 that makes it faster and easier to retrieve type information from a component that may have multiple coclasses that determine its behavior.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iprovidemultipleclassinfo
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IProvideMultipleClassInfo extends IProvideClassInfo2{
    /**
     * The interface identifier for IProvideMultipleClassInfo
     * @type {Guid}
     */
    static IID => Guid("{a7aba9c1-8983-11cf-8f20-00805f2cd064}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Pointer<UInt32>} pcti 
     * @returns {HRESULT} 
     */
    GetMultiTypeInfoCount(pcti) {
        result := ComCall(5, this, "uint*", pcti, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iti 
     * @param {Integer} dwFlags 
     * @param {Pointer<ITypeInfo>} pptiCoClass 
     * @param {Pointer<UInt32>} pdwTIFlags 
     * @param {Pointer<UInt32>} pcdispidReserved 
     * @param {Pointer<Guid>} piidPrimary 
     * @param {Pointer<Guid>} piidSource 
     * @returns {HRESULT} 
     */
    GetInfoOfIndex(iti, dwFlags, pptiCoClass, pdwTIFlags, pcdispidReserved, piidPrimary, piidSource) {
        result := ComCall(6, this, "uint", iti, "uint", dwFlags, "ptr", pptiCoClass, "uint*", pdwTIFlags, "uint*", pcdispidReserved, "ptr", piidPrimary, "ptr", piidSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
