#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TF_DA_LINESTYLE.ahk" { TF_DA_LINESTYLE }
#Import ".\TF_DA_ATTR_INFO.ahk" { TF_DA_ATTR_INFO }
#Import ".\TF_DA_COLOR.ahk" { TF_DA_COLOR }
#Import ".\TF_DA_COLORTYPE.ahk" { TF_DA_COLORTYPE }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The TF_DISPLAYATTRIBUTE structure contains display attribute data for rendering text.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ns-msctf-tf_displayattribute
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TF_DISPLAYATTRIBUTE {
    #StructPack 4

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_da_color">TF_DA_COLOR</a> structure that defines the text foreground color.
     */
    crText : TF_DA_COLOR

    /**
     * Contains a <b>TF_DA_COLOR</b> structure that defines the text background color.
     */
    crBk : TF_DA_COLOR

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/win32/api/msctf/ne-msctf-tf_da_linestyle">TF_DA_LINESTYLE</a> enumeration value that defines the underline style.
     */
    lsStyle : TF_DA_LINESTYLE

    /**
     * A BOOL value that specifies if the underline should be bold or normal weight. If this value is nonzero, the underline should be bold. If this value is zero, the underline should be normal.
     */
    fBoldLine : BOOL

    /**
     * Contains a <b>TF_DA_COLOR</b> structure that defines the color of the underline.
     */
    crLine : TF_DA_COLOR

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/win32/api/msctf/ne-msctf-tf_da_attr_info">TF_DA_ATTR_INFO</a> value that defines text conversion display attribute data.
     */
    bAttr : TF_DA_ATTR_INFO

}
