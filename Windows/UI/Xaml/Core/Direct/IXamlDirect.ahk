#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXamlDirectObject.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\DateTime.ahk
#Include ..\..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Color.ahk
#Include ..\..\CornerRadius.ahk
#Include ..\..\Duration.ahk
#Include ..\..\GridLength.ahk
#Include ..\..\Thickness.ahk
#Include ..\..\Media\Matrix.ahk
#Include ..\..\Media\Media3D\Matrix3D.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the primary object type that participates in the [XamlDirect](xamldirect.md) set of APIs.
 * @remarks
 * The [XamlDirect](xamldirect.md) APIs allows middleware authors to access most of Xaml at a more primitive level, achieving better CPU and working set performance.  
 * IXamlDirectObject is the minimal handle to Xaml's internal object instances. It is used only by [XamlDirect](xamldirect.md) APIs.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.core.direct.ixamldirectobject
 * @namespace Windows.UI.Xaml.Core.Direct
 * @version WindowsRuntime 1.4
 */
class IXamlDirect extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlDirect
     * @type {Guid}
     */
    static IID => Guid("{5ffa1295-add2-590f-a051-70989b866ade}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObject", "GetXamlDirectObject", "CreateInstance", "SetObjectProperty", "SetXamlDirectObjectProperty", "SetBooleanProperty", "SetDoubleProperty", "SetInt32Property", "SetStringProperty", "SetDateTimeProperty", "SetPointProperty", "SetRectProperty", "SetSizeProperty", "SetTimeSpanProperty", "SetColorProperty", "SetCornerRadiusProperty", "SetDurationProperty", "SetGridLengthProperty", "SetThicknessProperty", "SetMatrixProperty", "SetMatrix3DProperty", "SetEnumProperty", "GetObjectProperty", "GetXamlDirectObjectProperty", "GetBooleanProperty", "GetDoubleProperty", "GetInt32Property", "GetStringProperty", "GetDateTimeProperty", "GetPointProperty", "GetRectProperty", "GetSizeProperty", "GetTimeSpanProperty", "GetColorProperty", "GetCornerRadiusProperty", "GetDurationProperty", "GetGridLengthProperty", "GetThicknessProperty", "GetMatrixProperty", "GetMatrix3DProperty", "GetEnumProperty", "ClearProperty", "GetCollectionCount", "GetXamlDirectObjectFromCollectionAt", "AddToCollection", "InsertIntoCollectionAt", "RemoveFromCollection", "RemoveFromCollectionAt", "ClearCollection", "AddEventHandler", "AddEventHandler_HandledEventsToo", "RemoveEventHandler"]

    /**
     * The GetObject function (wingdi.h) retrieves information for the specified graphics object.
     * @remarks
     * The buffer pointed to by the <i>lpvObject</i> parameter must be sufficiently large to receive the information about the graphics object. Depending on the graphics object, the function uses a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmap">BITMAP</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-dibsection">DIBSECTION</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-extlogpen">EXTLOGPEN</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logbrush">LOGBRUSH</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logpen">LOGPEN</a> structure, or a count of table entries (for a logical palette).
     * 
     * If <i>hgdiobj</i> is a handle to a bitmap created by calling <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibsection">CreateDIBSection</a>, and the specified buffer is large enough, the <b>GetObject</b> function returns a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-dibsection">DIBSECTION</a> structure. In addition, the <b>bmBits</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmap">BITMAP</a> structure contained within the <b>DIBSECTION</b> will contain a pointer to the bitmap's bit values.
     * 
     * If <i>hgdiobj</i> is a handle to a bitmap created by any other means, <b>GetObject</b> returns only the width, height, and color format information of the bitmap. You can obtain the bitmap's bit values by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getdibits">GetDIBits</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getbitmapbits">GetBitmapBits</a> function.
     * 
     * If <i>hgdiobj</i> is a handle to a logical palette, <b>GetObject</b> retrieves a 2-byte integer that specifies the number of entries in the palette. The function does not retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logpalette">LOGPALETTE</a> structure defining the palette. To retrieve information about palette entries, an application can call the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getpaletteentries">GetPaletteEntries</a> function.
     * 
     * If <i>hgdiobj</i> is a handle to a font, the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> that is returned is the <b>LOGFONT</b> used to create the font. If Windows had to make some interpolation of the font because the precise <b>LOGFONT</b> could not be represented, the interpolation will not be reflected in the <b>LOGFONT</b>. For example, if you ask for a vertical version of a font that doesn't support vertical painting, the <b>LOGFONT</b> indicates the font is vertical, but Windows will paint it horizontally.
     * @param {IXamlDirectObject} xamlDirectObject 
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-getobject
     */
    GetObject(xamlDirectObject) {
        result := ComCall(6, this, "ptr", xamlDirectObject, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {IInspectable} object_ 
     * @returns {IXamlDirectObject} 
     */
    GetXamlDirectObject(object_) {
        result := ComCall(7, this, "ptr", object_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXamlDirectObject(result_)
    }

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {Integer} typeIndex 
     * @returns {IXamlDirectObject} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(typeIndex) {
        result := ComCall(8, this, "int", typeIndex, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXamlDirectObject(result_)
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    SetObjectProperty(xamlDirectObject, propertyIndex, value) {
        result := ComCall(9, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {IXamlDirectObject} value 
     * @returns {HRESULT} 
     */
    SetXamlDirectObjectProperty(xamlDirectObject, propertyIndex, value) {
        result := ComCall(10, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    SetBooleanProperty(xamlDirectObject, propertyIndex, value) {
        result := ComCall(11, this, "ptr", xamlDirectObject, "int", propertyIndex, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    SetDoubleProperty(xamlDirectObject, propertyIndex, value) {
        result := ComCall(12, this, "ptr", xamlDirectObject, "int", propertyIndex, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetInt32Property(xamlDirectObject, propertyIndex, value) {
        result := ComCall(13, this, "ptr", xamlDirectObject, "int", propertyIndex, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    SetStringProperty(xamlDirectObject, propertyIndex, value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(14, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    SetDateTimeProperty(xamlDirectObject, propertyIndex, value) {
        result := ComCall(15, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    SetPointProperty(xamlDirectObject, propertyIndex, value) {
        result := ComCall(16, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    SetRectProperty(xamlDirectObject, propertyIndex, value) {
        result := ComCall(17, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    SetSizeProperty(xamlDirectObject, propertyIndex, value) {
        result := ComCall(18, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    SetTimeSpanProperty(xamlDirectObject, propertyIndex, value) {
        result := ComCall(19, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    SetColorProperty(xamlDirectObject, propertyIndex, value) {
        result := ComCall(20, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {CornerRadius} value 
     * @returns {HRESULT} 
     */
    SetCornerRadiusProperty(xamlDirectObject, propertyIndex, value) {
        result := ComCall(21, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {Duration} value 
     * @returns {HRESULT} 
     */
    SetDurationProperty(xamlDirectObject, propertyIndex, value) {
        result := ComCall(22, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {GridLength} value 
     * @returns {HRESULT} 
     */
    SetGridLengthProperty(xamlDirectObject, propertyIndex, value) {
        result := ComCall(23, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    SetThicknessProperty(xamlDirectObject, propertyIndex, value) {
        result := ComCall(24, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {Matrix} value 
     * @returns {HRESULT} 
     */
    SetMatrixProperty(xamlDirectObject, propertyIndex, value) {
        result := ComCall(25, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {Matrix3D} value 
     * @returns {HRESULT} 
     */
    SetMatrix3DProperty(xamlDirectObject, propertyIndex, value) {
        result := ComCall(26, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetEnumProperty(xamlDirectObject, propertyIndex, value) {
        result := ComCall(27, this, "ptr", xamlDirectObject, "int", propertyIndex, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {IInspectable} 
     */
    GetObjectProperty(xamlDirectObject, propertyIndex) {
        result := ComCall(28, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {IXamlDirectObject} 
     */
    GetXamlDirectObjectProperty(xamlDirectObject, propertyIndex) {
        result := ComCall(29, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXamlDirectObject(result_)
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {Boolean} 
     */
    GetBooleanProperty(xamlDirectObject, propertyIndex) {
        result := ComCall(30, this, "ptr", xamlDirectObject, "int", propertyIndex, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {Float} 
     */
    GetDoubleProperty(xamlDirectObject, propertyIndex) {
        result := ComCall(31, this, "ptr", xamlDirectObject, "int", propertyIndex, "double*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {Integer} 
     */
    GetInt32Property(xamlDirectObject, propertyIndex) {
        result := ComCall(32, this, "ptr", xamlDirectObject, "int", propertyIndex, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {HSTRING} 
     */
    GetStringProperty(xamlDirectObject, propertyIndex) {
        result_ := HSTRING()
        result := ComCall(33, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {DateTime} 
     */
    GetDateTimeProperty(xamlDirectObject, propertyIndex) {
        result_ := DateTime()
        result := ComCall(34, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {POINT} 
     */
    GetPointProperty(xamlDirectObject, propertyIndex) {
        result_ := POINT()
        result := ComCall(35, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {RECT} 
     */
    GetRectProperty(xamlDirectObject, propertyIndex) {
        result_ := RECT()
        result := ComCall(36, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {SIZE} 
     */
    GetSizeProperty(xamlDirectObject, propertyIndex) {
        result_ := SIZE()
        result := ComCall(37, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {TimeSpan} 
     */
    GetTimeSpanProperty(xamlDirectObject, propertyIndex) {
        result_ := TimeSpan()
        result := ComCall(38, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {Color} 
     */
    GetColorProperty(xamlDirectObject, propertyIndex) {
        result_ := Color()
        result := ComCall(39, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {CornerRadius} 
     */
    GetCornerRadiusProperty(xamlDirectObject, propertyIndex) {
        result_ := CornerRadius()
        result := ComCall(40, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {Duration} 
     */
    GetDurationProperty(xamlDirectObject, propertyIndex) {
        result_ := Duration()
        result := ComCall(41, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {GridLength} 
     */
    GetGridLengthProperty(xamlDirectObject, propertyIndex) {
        result_ := GridLength()
        result := ComCall(42, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {Thickness} 
     */
    GetThicknessProperty(xamlDirectObject, propertyIndex) {
        result_ := Thickness()
        result := ComCall(43, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {Matrix} 
     */
    GetMatrixProperty(xamlDirectObject, propertyIndex) {
        result_ := Matrix()
        result := ComCall(44, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {Matrix3D} 
     */
    GetMatrix3DProperty(xamlDirectObject, propertyIndex) {
        result_ := Matrix3D()
        result := ComCall(45, this, "ptr", xamlDirectObject, "int", propertyIndex, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {Integer} 
     */
    GetEnumProperty(xamlDirectObject, propertyIndex) {
        result := ComCall(46, this, "ptr", xamlDirectObject, "int", propertyIndex, "uint*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} propertyIndex 
     * @returns {HRESULT} 
     */
    ClearProperty(xamlDirectObject, propertyIndex) {
        result := ComCall(47, this, "ptr", xamlDirectObject, "int", propertyIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @returns {Integer} 
     */
    GetCollectionCount(xamlDirectObject) {
        result := ComCall(48, this, "ptr", xamlDirectObject, "uint*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} index 
     * @returns {IXamlDirectObject} 
     */
    GetXamlDirectObjectFromCollectionAt(xamlDirectObject, index) {
        result := ComCall(49, this, "ptr", xamlDirectObject, "uint", index, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXamlDirectObject(result_)
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {IXamlDirectObject} value 
     * @returns {HRESULT} 
     */
    AddToCollection(xamlDirectObject, value) {
        result := ComCall(50, this, "ptr", xamlDirectObject, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} index 
     * @param {IXamlDirectObject} value 
     * @returns {HRESULT} 
     */
    InsertIntoCollectionAt(xamlDirectObject, index, value) {
        result := ComCall(51, this, "ptr", xamlDirectObject, "uint", index, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {IXamlDirectObject} value 
     * @returns {Boolean} 
     */
    RemoveFromCollection(xamlDirectObject, value) {
        result := ComCall(52, this, "ptr", xamlDirectObject, "ptr", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    RemoveFromCollectionAt(xamlDirectObject, index) {
        result := ComCall(53, this, "ptr", xamlDirectObject, "uint", index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @returns {HRESULT} 
     */
    ClearCollection(xamlDirectObject) {
        result := ComCall(54, this, "ptr", xamlDirectObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} eventIndex 
     * @param {IInspectable} handler 
     * @returns {HRESULT} 
     */
    AddEventHandler(xamlDirectObject, eventIndex, handler) {
        result := ComCall(55, this, "ptr", xamlDirectObject, "int", eventIndex, "ptr", handler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} eventIndex 
     * @param {IInspectable} handler 
     * @param {Boolean} handledEventsToo 
     * @returns {HRESULT} 
     */
    AddEventHandler_HandledEventsToo(xamlDirectObject, eventIndex, handler, handledEventsToo) {
        result := ComCall(56, this, "ptr", xamlDirectObject, "int", eventIndex, "ptr", handler, "int", handledEventsToo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlDirectObject} xamlDirectObject 
     * @param {Integer} eventIndex 
     * @param {IInspectable} handler 
     * @returns {HRESULT} 
     */
    RemoveEventHandler(xamlDirectObject, eventIndex, handler) {
        result := ComCall(57, this, "ptr", xamlDirectObject, "int", eventIndex, "ptr", handler, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
