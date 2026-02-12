#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DataPackageView.ahk
#Include .\DataPackagePropertySet.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Storage\Streams\RandomAccessStreamReference.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IDataPackage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataPackage
     * @type {Guid}
     */
    static IID => Guid("{61ebf5c7-efea-4346-9554-981d7e198ffe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetView", "get_Properties", "get_RequestedOperation", "put_RequestedOperation", "add_OperationCompleted", "remove_OperationCompleted", "add_Destroyed", "remove_Destroyed", "SetData", "SetDataProvider", "SetText", "SetUri", "SetHtmlFormat", "get_ResourceMap", "SetRtf", "SetBitmap", "SetStorageItemsReadOnly", "SetStorageItems1"]

    /**
     * @type {DataPackagePropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {Integer} 
     */
    RequestedOperation {
        get => this.get_RequestedOperation()
        set => this.put_RequestedOperation(value)
    }

    /**
     * @type {IMap<HSTRING, RandomAccessStreamReference>} 
     */
    ResourceMap {
        get => this.get_ResourceMap()
    }

    /**
     * The GetViewportExtEx function retrieves the x-extent and y-extent of the current viewport for the specified device context.
     * @returns {DataPackageView} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-getviewportextex
     */
    GetView() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataPackageView(result_)
    }

    /**
     * 
     * @returns {DataPackagePropertySet} 
     */
    get_Properties() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataPackagePropertySet(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestedOperation() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RequestedOperation(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<DataPackage, OperationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OperationCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_OperationCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<DataPackage, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Destroyed(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Destroyed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} formatId 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    SetData(formatId, value) {
        if(formatId is String) {
            pin := HSTRING.Create(formatId)
            formatId := pin.Value
        }
        formatId := formatId is Win32Handle ? NumGet(formatId, "ptr") : formatId

        result := ComCall(14, this, "ptr", formatId, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} formatId 
     * @param {DataProviderHandler} delayRenderer 
     * @returns {HRESULT} 
     */
    SetDataProvider(formatId, delayRenderer) {
        if(formatId is String) {
            pin := HSTRING.Create(formatId)
            formatId := pin.Value
        }
        formatId := formatId is Win32Handle ? NumGet(formatId, "ptr") : formatId

        result := ComCall(15, this, "ptr", formatId, "ptr", delayRenderer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetTextAlign function sets the text-alignment flags for the specified device context.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-textouta">TextOut</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-exttextouta">ExtTextOut</a> functions use the text-alignment flags to position a string of text on a display or other device. The flags specify the relationship between a reference point and a rectangle that bounds the text. The reference point is either the current position or a point passed to a text output function.
     * 
     * The rectangle that bounds the text is formed by the character cells in the text string.
     * 
     * The best way to get left-aligned text is to use either
     * 
     * 
     * ```cpp
     * 
     * SetTextAlign (hdc, GetTextAlign(hdc) & (~TA_CENTER))
     * 
     * ```
     * 
     * 
     * or
     * 
     * 
     * ```cpp
     * 
     * SetTextAlign (hdc,TA_LEFT | <other flags>)
     * 
     * ```
     * 
     * 
     * You can also use <b>SetTextAlign</b> (hdc, TA_LEFT) for this purpose, but this loses any vertical or right-to-left settings.
     * 
     * <div class="alert"><b>Note</b>  You should not use <b>SetTextAlign</b> with TA_UPDATECP when you are using <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptstringout">ScriptStringOut</a>, because selected text is not rendered correctly. If you must use this flag, you can unset and reset it as necessary to avoid the problem.</div>
     * <div> </div>
     * @param {HSTRING} value 
     * @returns {HRESULT} If the function succeeds, the return value is the previous text-alignment setting.
     * 
     * If the function fails, the return value is GDI_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-settextalign
     */
    SetText(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    SetUri(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    SetHtmlFormat(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IMap<HSTRING, RandomAccessStreamReference>} 
     */
    get_ResourceMap() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), RandomAccessStreamReference, value)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    SetRtf(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetBitmapBits function sets the bits of color data for a bitmap to the specified values.
     * @remarks
     * The array identified by <i>lpBits</i> must be WORD aligned.
     * @param {RandomAccessStreamReference} value 
     * @returns {HRESULT} If the function succeeds, the return value is the number of bytes used in setting the bitmap bits.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-setbitmapbits
     */
    SetBitmap(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<IStorageItem>} value 
     * @returns {HRESULT} 
     */
    SetStorageItemsReadOnly(value) {
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<IStorageItem>} value 
     * @param {Boolean} readOnly 
     * @returns {HRESULT} 
     */
    SetStorageItems1(value, readOnly) {
        result := ComCall(23, this, "ptr", value, "int", readOnly, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
