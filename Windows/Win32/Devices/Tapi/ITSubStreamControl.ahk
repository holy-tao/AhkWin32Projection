#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITSubStreamControl interface exposes methods that allow an application to enumerate, create, or remove substreams. Many MSPs do not support this interface.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itsubstreamcontrol
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITSubStreamControl extends IDispatch{
    /**
     * The interface identifier for ITSubStreamControl
     * @type {Guid}
     */
    static IID => Guid("{ee3bd607-3868-11d2-a045-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<ITSubStream>} ppSubStream 
     * @returns {HRESULT} 
     */
    CreateSubStream(ppSubStream) {
        result := ComCall(7, this, "ptr", ppSubStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITSubStream>} pSubStream 
     * @returns {HRESULT} 
     */
    RemoveSubStream(pSubStream) {
        result := ComCall(8, this, "ptr", pSubStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSubStream>} ppEnumSubStream 
     * @returns {HRESULT} 
     */
    EnumerateSubStreams(ppEnumSubStream) {
        result := ComCall(9, this, "ptr", ppEnumSubStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_SubStreams(pVariant) {
        result := ComCall(10, this, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
