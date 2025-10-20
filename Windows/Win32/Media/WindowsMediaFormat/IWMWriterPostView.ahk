#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMWriterPostView interface manages advanced writing functionality related to the postviewing of samples.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriterpostview
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterPostView extends IUnknown{
    /**
     * The interface identifier for IWMWriterPostView
     * @type {Guid}
     */
    static IID => Guid("{81e20ce4-75ef-491a-8004-fc53c45bdc3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IWMWriterPostViewCallback>} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    SetPostViewCallback(pCallback, pvContext) {
        result := ComCall(3, this, "ptr", pCallback, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {BOOL} fReceivePostViewSamples 
     * @returns {HRESULT} 
     */
    SetReceivePostViewSamples(wStreamNum, fReceivePostViewSamples) {
        result := ComCall(4, this, "ushort", wStreamNum, "int", fReceivePostViewSamples, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<BOOL>} pfReceivePostViewSamples 
     * @returns {HRESULT} 
     */
    GetReceivePostViewSamples(wStreamNum, pfReceivePostViewSamples) {
        result := ComCall(5, this, "ushort", wStreamNum, "ptr", pfReceivePostViewSamples, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {Pointer<IWMMediaProps>} ppOutput 
     * @returns {HRESULT} 
     */
    GetPostViewProps(wStreamNumber, ppOutput) {
        result := ComCall(6, this, "ushort", wStreamNumber, "ptr", ppOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {Pointer<IWMMediaProps>} pOutput 
     * @returns {HRESULT} 
     */
    SetPostViewProps(wStreamNumber, pOutput) {
        result := ComCall(7, this, "ushort", wStreamNumber, "ptr", pOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {Pointer<UInt32>} pcFormats 
     * @returns {HRESULT} 
     */
    GetPostViewFormatCount(wStreamNumber, pcFormats) {
        result := ComCall(8, this, "ushort", wStreamNumber, "uint*", pcFormats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {Integer} dwFormatNumber 
     * @param {Pointer<IWMMediaProps>} ppProps 
     * @returns {HRESULT} 
     */
    GetPostViewFormat(wStreamNumber, dwFormatNumber, ppProps) {
        result := ComCall(9, this, "ushort", wStreamNumber, "uint", dwFormatNumber, "ptr", ppProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {BOOL} fAllocate 
     * @returns {HRESULT} 
     */
    SetAllocateForPostView(wStreamNumber, fAllocate) {
        result := ComCall(10, this, "ushort", wStreamNumber, "int", fAllocate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {Pointer<BOOL>} pfAllocate 
     * @returns {HRESULT} 
     */
    GetAllocateForPostView(wStreamNumber, pfAllocate) {
        result := ComCall(11, this, "ushort", wStreamNumber, "ptr", pfAllocate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
