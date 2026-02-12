#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MapStyleSheet.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapStyleSheetStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapStyleSheetStatics
     * @type {Guid}
     */
    static IID => Guid("{abbd00ad-0a1c-4335-82f4-61d936aa197d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Aerial", "AerialWithOverlay", "RoadLight", "RoadDark", "RoadHighContrastLight", "RoadHighContrastDark", "Combine", "ParseFromJson", "TryParseFromJson"]

    /**
     * 
     * @returns {MapStyleSheet} 
     */
    Aerial() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapStyleSheet(result_)
    }

    /**
     * 
     * @returns {MapStyleSheet} 
     */
    AerialWithOverlay() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapStyleSheet(result_)
    }

    /**
     * 
     * @returns {MapStyleSheet} 
     */
    RoadLight() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapStyleSheet(result_)
    }

    /**
     * 
     * @returns {MapStyleSheet} 
     */
    RoadDark() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapStyleSheet(result_)
    }

    /**
     * 
     * @returns {MapStyleSheet} 
     */
    RoadHighContrastLight() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapStyleSheet(result_)
    }

    /**
     * 
     * @returns {MapStyleSheet} 
     */
    RoadHighContrastDark() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapStyleSheet(result_)
    }

    /**
     * The CombineRgn function combines two regions and stores the result in a third region. The two regions are combined according to the specified mode.
     * @remarks
     * The three regions need not be distinct. For example, the <i>hrgnSrc1</i> parameter can equal the <i>hrgnDest</i> parameter.
     * @param {IIterable<MapStyleSheet>} styleSheets 
     * @returns {MapStyleSheet} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-combinergn
     */
    Combine(styleSheets) {
        result := ComCall(12, this, "ptr", styleSheets, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapStyleSheet(result_)
    }

    /**
     * 
     * @param {HSTRING} styleAsJson 
     * @returns {MapStyleSheet} 
     */
    ParseFromJson(styleAsJson) {
        if(styleAsJson is String) {
            pin := HSTRING.Create(styleAsJson)
            styleAsJson := pin.Value
        }
        styleAsJson := styleAsJson is Win32Handle ? NumGet(styleAsJson, "ptr") : styleAsJson

        result := ComCall(13, this, "ptr", styleAsJson, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapStyleSheet(result_)
    }

    /**
     * 
     * @param {HSTRING} styleAsJson 
     * @param {Pointer<MapStyleSheet>} styleSheet 
     * @returns {Boolean} 
     */
    TryParseFromJson(styleAsJson, styleSheet) {
        if(styleAsJson is String) {
            pin := HSTRING.Create(styleAsJson)
            styleAsJson := pin.Value
        }
        styleAsJson := styleAsJson is Win32Handle ? NumGet(styleAsJson, "ptr") : styleAsJson

        result := ComCall(14, this, "ptr", styleAsJson, "ptr", styleSheet, "int*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }
}
