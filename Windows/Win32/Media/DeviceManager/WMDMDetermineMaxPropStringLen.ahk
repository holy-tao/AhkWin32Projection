#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class WMDMDetermineMaxPropStringLen extends Win32Struct
{
    static sizeof => 3170

    static packingSize => 2

    /**
     * @type {String}
     */
    sz001 {
        get => StrGet(this.ptr + 0, 26, "UTF-16")
        set => StrPut(value, this.ptr + 0, 26, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz002 {
        get => StrGet(this.ptr + 0, 30, "UTF-16")
        set => StrPut(value, this.ptr + 0, 30, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz003 {
        get => StrGet(this.ptr + 0, 13, "UTF-16")
        set => StrPut(value, this.ptr + 0, 13, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz004 {
        get => StrGet(this.ptr + 0, 15, "UTF-16")
        set => StrPut(value, this.ptr + 0, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz005 {
        get => StrGet(this.ptr + 0, 21, "UTF-16")
        set => StrPut(value, this.ptr + 0, 21, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz006 {
        get => StrGet(this.ptr + 0, 13, "UTF-16")
        set => StrPut(value, this.ptr + 0, 13, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz007 {
        get => StrGet(this.ptr + 0, 19, "UTF-16")
        set => StrPut(value, this.ptr + 0, 19, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz008 {
        get => StrGet(this.ptr + 0, 19, "UTF-16")
        set => StrPut(value, this.ptr + 0, 19, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz009 {
        get => StrGet(this.ptr + 0, 21, "UTF-16")
        set => StrPut(value, this.ptr + 0, 21, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz010 {
        get => StrGet(this.ptr + 0, 10, "UTF-16")
        set => StrPut(value, this.ptr + 0, 10, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz011 {
        get => StrGet(this.ptr + 0, 11, "UTF-16")
        set => StrPut(value, this.ptr + 0, 11, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz012 {
        get => StrGet(this.ptr + 0, 16, "UTF-16")
        set => StrPut(value, this.ptr + 0, 16, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz013 {
        get => StrGet(this.ptr + 0, 16, "UTF-16")
        set => StrPut(value, this.ptr + 0, 16, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz014 {
        get => StrGet(this.ptr + 0, 15, "UTF-16")
        set => StrPut(value, this.ptr + 0, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz015 {
        get => StrGet(this.ptr + 0, 16, "UTF-16")
        set => StrPut(value, this.ptr + 0, 16, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz016 {
        get => StrGet(this.ptr + 0, 10, "UTF-16")
        set => StrPut(value, this.ptr + 0, 10, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz017 {
        get => StrGet(this.ptr + 0, 10, "UTF-16")
        set => StrPut(value, this.ptr + 0, 10, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz018 {
        get => StrGet(this.ptr + 0, 14, "UTF-16")
        set => StrPut(value, this.ptr + 0, 14, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz019 {
        get => StrGet(this.ptr + 0, 21, "UTF-16")
        set => StrPut(value, this.ptr + 0, 21, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz020 {
        get => StrGet(this.ptr + 0, 19, "UTF-16")
        set => StrPut(value, this.ptr + 0, 19, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz021 {
        get => StrGet(this.ptr + 0, 21, "UTF-16")
        set => StrPut(value, this.ptr + 0, 21, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz022 {
        get => StrGet(this.ptr + 0, 20, "UTF-16")
        set => StrPut(value, this.ptr + 0, 20, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz023 {
        get => StrGet(this.ptr + 0, 23, "UTF-16")
        set => StrPut(value, this.ptr + 0, 23, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz024 {
        get => StrGet(this.ptr + 0, 19, "UTF-16")
        set => StrPut(value, this.ptr + 0, 19, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz025 {
        get => StrGet(this.ptr + 0, 9, "UTF-16")
        set => StrPut(value, this.ptr + 0, 9, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz026 {
        get => StrGet(this.ptr + 0, 13, "UTF-16")
        set => StrPut(value, this.ptr + 0, 13, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz027 {
        get => StrGet(this.ptr + 0, 10, "UTF-16")
        set => StrPut(value, this.ptr + 0, 10, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz028 {
        get => StrGet(this.ptr + 0, 10, "UTF-16")
        set => StrPut(value, this.ptr + 0, 10, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz029 {
        get => StrGet(this.ptr + 0, 12, "UTF-16")
        set => StrPut(value, this.ptr + 0, 12, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz030 {
        get => StrGet(this.ptr + 0, 16, "UTF-16")
        set => StrPut(value, this.ptr + 0, 16, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz031 {
        get => StrGet(this.ptr + 0, 15, "UTF-16")
        set => StrPut(value, this.ptr + 0, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz032 {
        get => StrGet(this.ptr + 0, 16, "UTF-16")
        set => StrPut(value, this.ptr + 0, 16, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz033 {
        get => StrGet(this.ptr + 0, 19, "UTF-16")
        set => StrPut(value, this.ptr + 0, 19, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz034 {
        get => StrGet(this.ptr + 0, 18, "UTF-16")
        set => StrPut(value, this.ptr + 0, 18, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz035 {
        get => StrGet(this.ptr + 0, 17, "UTF-16")
        set => StrPut(value, this.ptr + 0, 17, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz036 {
        get => StrGet(this.ptr + 0, 17, "UTF-16")
        set => StrPut(value, this.ptr + 0, 17, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz037 {
        get => StrGet(this.ptr + 0, 14, "UTF-16")
        set => StrPut(value, this.ptr + 0, 14, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz041 {
        get => StrGet(this.ptr + 0, 13, "UTF-16")
        set => StrPut(value, this.ptr + 0, 13, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz043 {
        get => StrGet(this.ptr + 0, 21, "UTF-16")
        set => StrPut(value, this.ptr + 0, 21, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz044 {
        get => StrGet(this.ptr + 0, 15, "UTF-16")
        set => StrPut(value, this.ptr + 0, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz045 {
        get => StrGet(this.ptr + 0, 19, "UTF-16")
        set => StrPut(value, this.ptr + 0, 19, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz046 {
        get => StrGet(this.ptr + 0, 13, "UTF-16")
        set => StrPut(value, this.ptr + 0, 13, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz047 {
        get => StrGet(this.ptr + 0, 13, "UTF-16")
        set => StrPut(value, this.ptr + 0, 13, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz048 {
        get => StrGet(this.ptr + 0, 11, "UTF-16")
        set => StrPut(value, this.ptr + 0, 11, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz049 {
        get => StrGet(this.ptr + 0, 24, "UTF-16")
        set => StrPut(value, this.ptr + 0, 24, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz050 {
        get => StrGet(this.ptr + 0, 25, "UTF-16")
        set => StrPut(value, this.ptr + 0, 25, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz051 {
        get => StrGet(this.ptr + 0, 24, "UTF-16")
        set => StrPut(value, this.ptr + 0, 24, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz052 {
        get => StrGet(this.ptr + 0, 15, "UTF-16")
        set => StrPut(value, this.ptr + 0, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz053 {
        get => StrGet(this.ptr + 0, 23, "UTF-16")
        set => StrPut(value, this.ptr + 0, 23, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz054 {
        get => StrGet(this.ptr + 0, 14, "UTF-16")
        set => StrPut(value, this.ptr + 0, 14, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz055 {
        get => StrGet(this.ptr + 0, 20, "UTF-16")
        set => StrPut(value, this.ptr + 0, 20, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz056 {
        get => StrGet(this.ptr + 0, 15, "UTF-16")
        set => StrPut(value, this.ptr + 0, 15, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz057 {
        get => StrGet(this.ptr + 0, 21, "UTF-16")
        set => StrPut(value, this.ptr + 0, 21, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz058 {
        get => StrGet(this.ptr + 0, 13, "UTF-16")
        set => StrPut(value, this.ptr + 0, 13, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz059 {
        get => StrGet(this.ptr + 0, 24, "UTF-16")
        set => StrPut(value, this.ptr + 0, 24, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz060 {
        get => StrGet(this.ptr + 0, 17, "UTF-16")
        set => StrPut(value, this.ptr + 0, 17, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz061 {
        get => StrGet(this.ptr + 0, 21, "UTF-16")
        set => StrPut(value, this.ptr + 0, 21, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz062 {
        get => StrGet(this.ptr + 0, 25, "UTF-16")
        set => StrPut(value, this.ptr + 0, 25, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz063 {
        get => StrGet(this.ptr + 0, 35, "UTF-16")
        set => StrPut(value, this.ptr + 0, 35, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz064 {
        get => StrGet(this.ptr + 0, 22, "UTF-16")
        set => StrPut(value, this.ptr + 0, 22, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz065 {
        get => StrGet(this.ptr + 0, 11, "UTF-16")
        set => StrPut(value, this.ptr + 0, 11, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz066 {
        get => StrGet(this.ptr + 0, 23, "UTF-16")
        set => StrPut(value, this.ptr + 0, 23, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz067 {
        get => StrGet(this.ptr + 0, 10, "UTF-16")
        set => StrPut(value, this.ptr + 0, 10, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz068 {
        get => StrGet(this.ptr + 0, 11, "UTF-16")
        set => StrPut(value, this.ptr + 0, 11, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz069 {
        get => StrGet(this.ptr + 0, 13, "UTF-16")
        set => StrPut(value, this.ptr + 0, 13, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz070 {
        get => StrGet(this.ptr + 0, 19, "UTF-16")
        set => StrPut(value, this.ptr + 0, 19, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz071 {
        get => StrGet(this.ptr + 0, 14, "UTF-16")
        set => StrPut(value, this.ptr + 0, 14, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz072 {
        get => StrGet(this.ptr + 0, 13, "UTF-16")
        set => StrPut(value, this.ptr + 0, 13, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz073 {
        get => StrGet(this.ptr + 0, 30, "UTF-16")
        set => StrPut(value, this.ptr + 0, 30, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz074 {
        get => StrGet(this.ptr + 0, 23, "UTF-16")
        set => StrPut(value, this.ptr + 0, 23, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz075 {
        get => StrGet(this.ptr + 0, 21, "UTF-16")
        set => StrPut(value, this.ptr + 0, 21, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz076 {
        get => StrGet(this.ptr + 0, 23, "UTF-16")
        set => StrPut(value, this.ptr + 0, 23, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz077 {
        get => StrGet(this.ptr + 0, 20, "UTF-16")
        set => StrPut(value, this.ptr + 0, 20, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz078 {
        get => StrGet(this.ptr + 0, 26, "UTF-16")
        set => StrPut(value, this.ptr + 0, 26, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz079 {
        get => StrGet(this.ptr + 0, 26, "UTF-16")
        set => StrPut(value, this.ptr + 0, 26, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz080 {
        get => StrGet(this.ptr + 0, 19, "UTF-16")
        set => StrPut(value, this.ptr + 0, 19, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz081 {
        get => StrGet(this.ptr + 0, 32, "UTF-16")
        set => StrPut(value, this.ptr + 0, 32, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz082 {
        get => StrGet(this.ptr + 0, 20, "UTF-16")
        set => StrPut(value, this.ptr + 0, 20, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz083 {
        get => StrGet(this.ptr + 0, 31, "UTF-16")
        set => StrPut(value, this.ptr + 0, 31, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz084 {
        get => StrGet(this.ptr + 0, 25, "UTF-16")
        set => StrPut(value, this.ptr + 0, 25, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz085 {
        get => StrGet(this.ptr + 0, 17, "UTF-16")
        set => StrPut(value, this.ptr + 0, 17, "UTF-16")
    }

    /**
     * @type {String}
     */
    sz086 {
        get => StrGet(this.ptr + 0, 29, "UTF-16")
        set => StrPut(value, this.ptr + 0, 29, "UTF-16")
    }
}
