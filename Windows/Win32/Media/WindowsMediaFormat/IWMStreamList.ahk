#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMStreamList interface is used by mutual exclusion objects and bandwidth sharing objects to maintain lists of streams.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmstreamlist
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMStreamList extends IUnknown{
    /**
     * The interface identifier for IWMStreamList
     * @type {Guid}
     */
    static IID => Guid("{96406bdd-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt16>} pwStreamNumArray 
     * @param {Pointer<UInt16>} pcStreams 
     * @returns {HRESULT} 
     */
    GetStreams(pwStreamNumArray, pcStreams) {
        result := ComCall(3, this, "ushort*", pwStreamNumArray, "ushort*", pcStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @returns {HRESULT} 
     */
    AddStream(wStreamNum) {
        result := ComCall(4, this, "ushort", wStreamNum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @returns {HRESULT} 
     */
    RemoveStream(wStreamNum) {
        result := ComCall(5, this, "ushort", wStreamNum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
