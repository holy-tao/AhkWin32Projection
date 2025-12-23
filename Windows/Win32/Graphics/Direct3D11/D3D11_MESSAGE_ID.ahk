#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Debug messages for setting up an info-queue filter (see D3D11_INFO_QUEUE_FILTER); use these messages to allow or deny message categories to pass through the storage and retrieval filters.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_id
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_MESSAGE_ID extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_UNKNOWN => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_IASETVERTEXBUFFERS_HAZARD => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_IASETINDEXBUFFER_HAZARD => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_VSSETSHADERRESOURCES_HAZARD => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_VSSETCONSTANTBUFFERS_HAZARD => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_GSSETSHADERRESOURCES_HAZARD => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_GSSETCONSTANTBUFFERS_HAZARD => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_PSSETSHADERRESOURCES_HAZARD => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_PSSETCONSTANTBUFFERS_HAZARD => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_OMSETRENDERTARGETS_HAZARD => 9

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SOSETTARGETS_HAZARD => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_STRING_FROM_APPLICATION => 11

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CORRUPTED_THIS => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CORRUPTED_PARAMETER1 => 13

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CORRUPTED_PARAMETER2 => 14

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CORRUPTED_PARAMETER3 => 15

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CORRUPTED_PARAMETER4 => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CORRUPTED_PARAMETER5 => 17

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CORRUPTED_PARAMETER6 => 18

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CORRUPTED_PARAMETER7 => 19

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CORRUPTED_PARAMETER8 => 20

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CORRUPTED_PARAMETER9 => 21

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CORRUPTED_PARAMETER10 => 22

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CORRUPTED_PARAMETER11 => 23

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CORRUPTED_PARAMETER12 => 24

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CORRUPTED_PARAMETER13 => 25

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CORRUPTED_PARAMETER14 => 26

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CORRUPTED_PARAMETER15 => 27

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CORRUPTED_MULTITHREADING => 28

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_MESSAGE_REPORTING_OUTOFMEMORY => 29

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_IASETINPUTLAYOUT_UNBINDDELETINGOBJECT => 30

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_IASETVERTEXBUFFERS_UNBINDDELETINGOBJECT => 31

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_IASETINDEXBUFFER_UNBINDDELETINGOBJECT => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VSSETSHADER_UNBINDDELETINGOBJECT => 33

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VSSETSHADERRESOURCES_UNBINDDELETINGOBJECT => 34

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VSSETCONSTANTBUFFERS_UNBINDDELETINGOBJECT => 35

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VSSETSAMPLERS_UNBINDDELETINGOBJECT => 36

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GSSETSHADER_UNBINDDELETINGOBJECT => 37

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GSSETSHADERRESOURCES_UNBINDDELETINGOBJECT => 38

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GSSETCONSTANTBUFFERS_UNBINDDELETINGOBJECT => 39

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GSSETSAMPLERS_UNBINDDELETINGOBJECT => 40

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SOSETTARGETS_UNBINDDELETINGOBJECT => 41

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_PSSETSHADER_UNBINDDELETINGOBJECT => 42

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_PSSETSHADERRESOURCES_UNBINDDELETINGOBJECT => 43

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_PSSETCONSTANTBUFFERS_UNBINDDELETINGOBJECT => 44

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_PSSETSAMPLERS_UNBINDDELETINGOBJECT => 45

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RSSETSTATE_UNBINDDELETINGOBJECT => 46

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_OMSETBLENDSTATE_UNBINDDELETINGOBJECT => 47

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_OMSETDEPTHSTENCILSTATE_UNBINDDELETINGOBJECT => 48

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_OMSETRENDERTARGETS_UNBINDDELETINGOBJECT => 49

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SETPREDICATION_UNBINDDELETINGOBJECT => 50

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETPRIVATEDATA_MOREDATA => 51

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SETPRIVATEDATA_INVALIDFREEDATA => 52

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SETPRIVATEDATA_INVALIDIUNKNOWN => 53

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SETPRIVATEDATA_INVALIDFLAGS => 54

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SETPRIVATEDATA_CHANGINGPARAMS => 55

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SETPRIVATEDATA_OUTOFMEMORY => 56

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_UNRECOGNIZEDFORMAT => 57

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_INVALIDSAMPLES => 58

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_UNRECOGNIZEDUSAGE => 59

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_UNRECOGNIZEDBINDFLAGS => 60

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_UNRECOGNIZEDCPUACCESSFLAGS => 61

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_UNRECOGNIZEDMISCFLAGS => 62

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_INVALIDCPUACCESSFLAGS => 63

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_INVALIDBINDFLAGS => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_INVALIDINITIALDATA => 65

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_INVALIDDIMENSIONS => 66

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_INVALIDMIPLEVELS => 67

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_INVALIDMISCFLAGS => 68

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_INVALIDARG_RETURN => 69

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_OUTOFMEMORY_RETURN => 70

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_NULLDESC => 71

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_INVALIDCONSTANTBUFFERBINDINGS => 72

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_LARGEALLOCATION => 73

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_UNRECOGNIZEDFORMAT => 74

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_UNSUPPORTEDFORMAT => 75

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_INVALIDSAMPLES => 76

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_UNRECOGNIZEDUSAGE => 77

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_UNRECOGNIZEDBINDFLAGS => 78

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_UNRECOGNIZEDCPUACCESSFLAGS => 79

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_UNRECOGNIZEDMISCFLAGS => 80

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_INVALIDCPUACCESSFLAGS => 81

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_INVALIDBINDFLAGS => 82

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_INVALIDINITIALDATA => 83

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_INVALIDDIMENSIONS => 84

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_INVALIDMIPLEVELS => 85

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_INVALIDMISCFLAGS => 86

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_INVALIDARG_RETURN => 87

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_OUTOFMEMORY_RETURN => 88

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_NULLDESC => 89

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_LARGEALLOCATION => 90

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_UNRECOGNIZEDFORMAT => 91

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_UNSUPPORTEDFORMAT => 92

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_INVALIDSAMPLES => 93

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_UNRECOGNIZEDUSAGE => 94

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_UNRECOGNIZEDBINDFLAGS => 95

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_UNRECOGNIZEDCPUACCESSFLAGS => 96

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_UNRECOGNIZEDMISCFLAGS => 97

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_INVALIDCPUACCESSFLAGS => 98

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_INVALIDBINDFLAGS => 99

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_INVALIDINITIALDATA => 100

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_INVALIDDIMENSIONS => 101

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_INVALIDMIPLEVELS => 102

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_INVALIDMISCFLAGS => 103

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_INVALIDARG_RETURN => 104

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_OUTOFMEMORY_RETURN => 105

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_NULLDESC => 106

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_LARGEALLOCATION => 107

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE3D_UNRECOGNIZEDFORMAT => 108

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE3D_UNSUPPORTEDFORMAT => 109

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE3D_INVALIDSAMPLES => 110

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE3D_UNRECOGNIZEDUSAGE => 111

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE3D_UNRECOGNIZEDBINDFLAGS => 112

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE3D_UNRECOGNIZEDCPUACCESSFLAGS => 113

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE3D_UNRECOGNIZEDMISCFLAGS => 114

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE3D_INVALIDCPUACCESSFLAGS => 115

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE3D_INVALIDBINDFLAGS => 116

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE3D_INVALIDINITIALDATA => 117

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE3D_INVALIDDIMENSIONS => 118

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE3D_INVALIDMIPLEVELS => 119

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE3D_INVALIDMISCFLAGS => 120

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE3D_INVALIDARG_RETURN => 121

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE3D_OUTOFMEMORY_RETURN => 122

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE3D_NULLDESC => 123

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE3D_LARGEALLOCATION => 124

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESHADERRESOURCEVIEW_UNRECOGNIZEDFORMAT => 125

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDDESC => 126

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDFORMAT => 127

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDDIMENSIONS => 128

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDRESOURCE => 129

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESHADERRESOURCEVIEW_TOOMANYOBJECTS => 130

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDARG_RETURN => 131

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESHADERRESOURCEVIEW_OUTOFMEMORY_RETURN => 132

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERENDERTARGETVIEW_UNRECOGNIZEDFORMAT => 133

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERENDERTARGETVIEW_UNSUPPORTEDFORMAT => 134

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDDESC => 135

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDFORMAT => 136

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDDIMENSIONS => 137

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDRESOURCE => 138

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERENDERTARGETVIEW_TOOMANYOBJECTS => 139

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDARG_RETURN => 140

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERENDERTARGETVIEW_OUTOFMEMORY_RETURN => 141

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_UNRECOGNIZEDFORMAT => 142

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_INVALIDDESC => 143

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_INVALIDFORMAT => 144

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_INVALIDDIMENSIONS => 145

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_INVALIDRESOURCE => 146

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_TOOMANYOBJECTS => 147

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_INVALIDARG_RETURN => 148

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_OUTOFMEMORY_RETURN => 149

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_OUTOFMEMORY => 150

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_TOOMANYELEMENTS => 151

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDFORMAT => 152

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_INCOMPATIBLEFORMAT => 153

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDSLOT => 154

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDINPUTSLOTCLASS => 155

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_STEPRATESLOTCLASSMISMATCH => 156

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDSLOTCLASSCHANGE => 157

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDSTEPRATECHANGE => 158

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDALIGNMENT => 159

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_DUPLICATESEMANTIC => 160

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_UNPARSEABLEINPUTSIGNATURE => 161

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_NULLSEMANTIC => 162

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_MISSINGELEMENT => 163

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_NULLDESC => 164

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVERTEXSHADER_OUTOFMEMORY => 165

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVERTEXSHADER_INVALIDSHADERBYTECODE => 166

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVERTEXSHADER_INVALIDSHADERTYPE => 167

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADER_OUTOFMEMORY => 168

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADER_INVALIDSHADERBYTECODE => 169

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADER_INVALIDSHADERTYPE => 170

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTOFMEMORY => 171

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSHADERBYTECODE => 172

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSHADERTYPE => 173

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDNUMENTRIES => 174

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTPUTSTREAMSTRIDEUNUSED => 175

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UNEXPECTEDDECL => 176

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_EXPECTEDDECL => 177

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTPUTSLOT0EXPECTED => 178

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDOUTPUTSLOT => 179

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_ONLYONEELEMENTPERSLOT => 180

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDCOMPONENTCOUNT => 181

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSTARTCOMPONENTANDCOMPONENTCOUNT => 182

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDGAPDEFINITION => 183

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_REPEATEDOUTPUT => 184

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDOUTPUTSTREAMSTRIDE => 185

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MISSINGSEMANTIC => 186

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MASKMISMATCH => 187

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_CANTHAVEONLYGAPS => 188

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_DECLTOOCOMPLEX => 189

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MISSINGOUTPUTSIGNATURE => 190

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEPIXELSHADER_OUTOFMEMORY => 191

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEPIXELSHADER_INVALIDSHADERBYTECODE => 192

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEPIXELSHADER_INVALIDSHADERTYPE => 193

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERASTERIZERSTATE_INVALIDFILLMODE => 194

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERASTERIZERSTATE_INVALIDCULLMODE => 195

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERASTERIZERSTATE_INVALIDDEPTHBIASCLAMP => 196

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERASTERIZERSTATE_INVALIDSLOPESCALEDDEPTHBIAS => 197

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERASTERIZERSTATE_TOOMANYOBJECTS => 198

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERASTERIZERSTATE_NULLDESC => 199

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDDEPTHWRITEMASK => 200

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDDEPTHFUNC => 201

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILFAILOP => 202

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILZFAILOP => 203

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILPASSOP => 204

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILFUNC => 205

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILFAILOP => 206

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILZFAILOP => 207

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILPASSOP => 208

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILFUNC => 209

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_TOOMANYOBJECTS => 210

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_NULLDESC => 211

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBLENDSTATE_INVALIDSRCBLEND => 212

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBLENDSTATE_INVALIDDESTBLEND => 213

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBLENDSTATE_INVALIDBLENDOP => 214

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBLENDSTATE_INVALIDSRCBLENDALPHA => 215

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBLENDSTATE_INVALIDDESTBLENDALPHA => 216

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBLENDSTATE_INVALIDBLENDOPALPHA => 217

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBLENDSTATE_INVALIDRENDERTARGETWRITEMASK => 218

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBLENDSTATE_TOOMANYOBJECTS => 219

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBLENDSTATE_NULLDESC => 220

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDFILTER => 221

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDADDRESSU => 222

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDADDRESSV => 223

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDADDRESSW => 224

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDMIPLODBIAS => 225

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDMAXANISOTROPY => 226

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDCOMPARISONFUNC => 227

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDMINLOD => 228

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDMAXLOD => 229

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_TOOMANYOBJECTS => 230

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_NULLDESC => 231

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEQUERYORPREDICATE_INVALIDQUERY => 232

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEQUERYORPREDICATE_INVALIDMISCFLAGS => 233

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEQUERYORPREDICATE_UNEXPECTEDMISCFLAG => 234

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEQUERYORPREDICATE_NULLDESC => 235

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_IASETPRIMITIVETOPOLOGY_TOPOLOGY_UNRECOGNIZED => 236

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_IASETPRIMITIVETOPOLOGY_TOPOLOGY_UNDEFINED => 237

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_IASETVERTEXBUFFERS_INVALIDBUFFER => 238

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_IASETVERTEXBUFFERS_OFFSET_TOO_LARGE => 239

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_IASETVERTEXBUFFERS_BUFFERS_EMPTY => 240

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_IASETINDEXBUFFER_INVALIDBUFFER => 241

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_IASETINDEXBUFFER_FORMAT_INVALID => 242

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_IASETINDEXBUFFER_OFFSET_TOO_LARGE => 243

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_IASETINDEXBUFFER_OFFSET_UNALIGNED => 244

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_VSSETSHADERRESOURCES_VIEWS_EMPTY => 245

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VSSETCONSTANTBUFFERS_INVALIDBUFFER => 246

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_VSSETCONSTANTBUFFERS_BUFFERS_EMPTY => 247

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_VSSETSAMPLERS_SAMPLERS_EMPTY => 248

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_GSSETSHADERRESOURCES_VIEWS_EMPTY => 249

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GSSETCONSTANTBUFFERS_INVALIDBUFFER => 250

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_GSSETCONSTANTBUFFERS_BUFFERS_EMPTY => 251

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_GSSETSAMPLERS_SAMPLERS_EMPTY => 252

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SOSETTARGETS_INVALIDBUFFER => 253

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SOSETTARGETS_OFFSET_UNALIGNED => 254

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_PSSETSHADERRESOURCES_VIEWS_EMPTY => 255

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_PSSETCONSTANTBUFFERS_INVALIDBUFFER => 256

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_PSSETCONSTANTBUFFERS_BUFFERS_EMPTY => 257

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_PSSETSAMPLERS_SAMPLERS_EMPTY => 258

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_RSSETVIEWPORTS_INVALIDVIEWPORT => 259

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_RSSETSCISSORRECTS_INVALIDSCISSOR => 260

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CLEARRENDERTARGETVIEW_DENORMFLUSH => 261

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CLEARDEPTHSTENCILVIEW_DENORMFLUSH => 262

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CLEARDEPTHSTENCILVIEW_INVALID => 263

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_IAGETVERTEXBUFFERS_BUFFERS_EMPTY => 264

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_VSGETSHADERRESOURCES_VIEWS_EMPTY => 265

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_VSGETCONSTANTBUFFERS_BUFFERS_EMPTY => 266

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_VSGETSAMPLERS_SAMPLERS_EMPTY => 267

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_GSGETSHADERRESOURCES_VIEWS_EMPTY => 268

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_GSGETCONSTANTBUFFERS_BUFFERS_EMPTY => 269

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_GSGETSAMPLERS_SAMPLERS_EMPTY => 270

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SOGETTARGETS_BUFFERS_EMPTY => 271

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_PSGETSHADERRESOURCES_VIEWS_EMPTY => 272

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_PSGETCONSTANTBUFFERS_BUFFERS_EMPTY => 273

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_PSGETSAMPLERS_SAMPLERS_EMPTY => 274

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_RSGETVIEWPORTS_VIEWPORTS_EMPTY => 275

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_RSGETSCISSORRECTS_RECTS_EMPTY => 276

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_GENERATEMIPS_RESOURCE_INVALID => 277

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYSUBRESOURCEREGION_INVALIDDESTINATIONSUBRESOURCE => 278

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYSUBRESOURCEREGION_INVALIDSOURCESUBRESOURCE => 279

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYSUBRESOURCEREGION_INVALIDSOURCEBOX => 280

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYSUBRESOURCEREGION_INVALIDSOURCE => 281

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYSUBRESOURCEREGION_INVALIDDESTINATIONSTATE => 282

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYSUBRESOURCEREGION_INVALIDSOURCESTATE => 283

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYRESOURCE_INVALIDSOURCE => 284

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYRESOURCE_INVALIDDESTINATIONSTATE => 285

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYRESOURCE_INVALIDSOURCESTATE => 286

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_UPDATESUBRESOURCE_INVALIDDESTINATIONSUBRESOURCE => 287

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_UPDATESUBRESOURCE_INVALIDDESTINATIONBOX => 288

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_UPDATESUBRESOURCE_INVALIDDESTINATIONSTATE => 289

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_RESOLVESUBRESOURCE_DESTINATION_INVALID => 290

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_RESOLVESUBRESOURCE_DESTINATION_SUBRESOURCE_INVALID => 291

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_RESOLVESUBRESOURCE_SOURCE_INVALID => 292

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_RESOLVESUBRESOURCE_SOURCE_SUBRESOURCE_INVALID => 293

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_RESOLVESUBRESOURCE_FORMAT_INVALID => 294

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_BUFFER_MAP_INVALIDMAPTYPE => 295

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_BUFFER_MAP_INVALIDFLAGS => 296

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_BUFFER_MAP_ALREADYMAPPED => 297

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_BUFFER_MAP_DEVICEREMOVED_RETURN => 298

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_BUFFER_UNMAP_NOTMAPPED => 299

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE1D_MAP_INVALIDMAPTYPE => 300

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE1D_MAP_INVALIDSUBRESOURCE => 301

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE1D_MAP_INVALIDFLAGS => 302

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE1D_MAP_ALREADYMAPPED => 303

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE1D_MAP_DEVICEREMOVED_RETURN => 304

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE1D_UNMAP_INVALIDSUBRESOURCE => 305

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE1D_UNMAP_NOTMAPPED => 306

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE2D_MAP_INVALIDMAPTYPE => 307

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE2D_MAP_INVALIDSUBRESOURCE => 308

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE2D_MAP_INVALIDFLAGS => 309

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE2D_MAP_ALREADYMAPPED => 310

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE2D_MAP_DEVICEREMOVED_RETURN => 311

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE2D_UNMAP_INVALIDSUBRESOURCE => 312

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE2D_UNMAP_NOTMAPPED => 313

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE3D_MAP_INVALIDMAPTYPE => 314

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE3D_MAP_INVALIDSUBRESOURCE => 315

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE3D_MAP_INVALIDFLAGS => 316

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE3D_MAP_ALREADYMAPPED => 317

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE3D_MAP_DEVICEREMOVED_RETURN => 318

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE3D_UNMAP_INVALIDSUBRESOURCE => 319

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXTURE3D_UNMAP_NOTMAPPED => 320

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CHECKFORMATSUPPORT_FORMAT_DEPRECATED => 321

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CHECKMULTISAMPLEQUALITYLEVELS_FORMAT_DEPRECATED => 322

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SETEXCEPTIONMODE_UNRECOGNIZEDFLAGS => 323

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SETEXCEPTIONMODE_INVALIDARG_RETURN => 324

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SETEXCEPTIONMODE_DEVICEREMOVED_RETURN => 325

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_REF_SIMULATING_INFINITELY_FAST_HARDWARE => 326

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_REF_THREADING_MODE => 327

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_REF_UMDRIVER_EXCEPTION => 328

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_REF_KMDRIVER_EXCEPTION => 329

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_REF_HARDWARE_EXCEPTION => 330

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_REF_ACCESSING_INDEXABLE_TEMP_OUT_OF_RANGE => 331

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_REF_PROBLEM_PARSING_SHADER => 332

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_REF_OUT_OF_MEMORY => 333

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_REF_INFO => 334

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_VERTEXPOS_OVERFLOW => 335

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAWINDEXED_INDEXPOS_OVERFLOW => 336

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAWINSTANCED_VERTEXPOS_OVERFLOW => 337

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAWINSTANCED_INSTANCEPOS_OVERFLOW => 338

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAWINDEXEDINSTANCED_INSTANCEPOS_OVERFLOW => 339

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAWINDEXEDINSTANCED_INDEXPOS_OVERFLOW => 340

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_VERTEX_SHADER_NOT_SET => 341

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SHADER_LINKAGE_SEMANTICNAME_NOT_FOUND => 342

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SHADER_LINKAGE_REGISTERINDEX => 343

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SHADER_LINKAGE_COMPONENTTYPE => 344

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SHADER_LINKAGE_REGISTERMASK => 345

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SHADER_LINKAGE_SYSTEMVALUE => 346

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SHADER_LINKAGE_NEVERWRITTEN_ALWAYSREADS => 347

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_VERTEX_BUFFER_NOT_SET => 348

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_INPUTLAYOUT_NOT_SET => 349

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_CONSTANT_BUFFER_NOT_SET => 350

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_CONSTANT_BUFFER_TOO_SMALL => 351

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_SAMPLER_NOT_SET => 352

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_SHADERRESOURCEVIEW_NOT_SET => 353

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_VIEW_DIMENSION_MISMATCH => 354

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_VERTEX_BUFFER_STRIDE_TOO_SMALL => 355

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_VERTEX_BUFFER_TOO_SMALL => 356

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_INDEX_BUFFER_NOT_SET => 357

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_INDEX_BUFFER_FORMAT_INVALID => 358

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_INDEX_BUFFER_TOO_SMALL => 359

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_GS_INPUT_PRIMITIVE_MISMATCH => 360

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_RESOURCE_RETURN_TYPE_MISMATCH => 361

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_POSITION_NOT_PRESENT => 362

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_OUTPUT_STREAM_NOT_SET => 363

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_BOUND_RESOURCE_MAPPED => 364

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_INVALID_PRIMITIVETOPOLOGY => 365

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_VERTEX_OFFSET_UNALIGNED => 366

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_VERTEX_STRIDE_UNALIGNED => 367

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_INDEX_OFFSET_UNALIGNED => 368

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_OUTPUT_STREAM_OFFSET_UNALIGNED => 369

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_RESOURCE_FORMAT_LD_UNSUPPORTED => 370

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_RESOURCE_FORMAT_SAMPLE_UNSUPPORTED => 371

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_RESOURCE_FORMAT_SAMPLE_C_UNSUPPORTED => 372

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_RESOURCE_MULTISAMPLE_UNSUPPORTED => 373

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_SO_TARGETS_BOUND_WITHOUT_SOURCE => 374

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_SO_STRIDE_LARGER_THAN_BUFFER => 375

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_OM_RENDER_TARGET_DOES_NOT_SUPPORT_BLENDING => 376

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_OM_DUAL_SOURCE_BLENDING_CAN_ONLY_HAVE_RENDER_TARGET_0 => 377

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_REMOVAL_PROCESS_AT_FAULT => 378

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_REMOVAL_PROCESS_POSSIBLY_AT_FAULT => 379

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_REMOVAL_PROCESS_NOT_AT_FAULT => 380

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_OPEN_SHARED_RESOURCE_INVALIDARG_RETURN => 381

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_OPEN_SHARED_RESOURCE_OUTOFMEMORY_RETURN => 382

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_OPEN_SHARED_RESOURCE_BADINTERFACE_RETURN => 383

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_VIEWPORT_NOT_SET => 384

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_TRAILING_DIGIT_IN_SEMANTIC => 385

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_TRAILING_DIGIT_IN_SEMANTIC => 386

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_RSSETVIEWPORTS_DENORMFLUSH => 387

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_OMSETRENDERTARGETS_INVALIDVIEW => 388

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SETTEXTFILTERSIZE_INVALIDDIMENSIONS => 389

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_SAMPLER_MISMATCH => 390

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_TYPE_MISMATCH => 391

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_BLENDSTATE_GETDESC_LEGACY => 392

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SHADERRESOURCEVIEW_GETDESC_LEGACY => 393

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEQUERY_OUTOFMEMORY_RETURN => 394

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEPREDICATE_OUTOFMEMORY_RETURN => 395

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATECOUNTER_OUTOFRANGE_COUNTER => 396

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATECOUNTER_SIMULTANEOUS_ACTIVE_COUNTERS_EXHAUSTED => 397

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATECOUNTER_UNSUPPORTED_WELLKNOWN_COUNTER => 398

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATECOUNTER_OUTOFMEMORY_RETURN => 399

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATECOUNTER_NONEXCLUSIVE_RETURN => 400

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATECOUNTER_NULLDESC => 401

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CHECKCOUNTER_OUTOFRANGE_COUNTER => 402

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CHECKCOUNTER_UNSUPPORTED_WELLKNOWN_COUNTER => 403

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SETPREDICATION_INVALID_PREDICATE_STATE => 404

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_QUERY_BEGIN_UNSUPPORTED => 405

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_PREDICATE_BEGIN_DURING_PREDICATION => 406

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_QUERY_BEGIN_DUPLICATE => 407

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_QUERY_BEGIN_ABANDONING_PREVIOUS_RESULTS => 408

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_PREDICATE_END_DURING_PREDICATION => 409

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_QUERY_END_ABANDONING_PREVIOUS_RESULTS => 410

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_QUERY_END_WITHOUT_BEGIN => 411

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_QUERY_GETDATA_INVALID_DATASIZE => 412

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_QUERY_GETDATA_INVALID_FLAGS => 413

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_QUERY_GETDATA_INVALID_CALL => 414

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_PS_OUTPUT_TYPE_MISMATCH => 415

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_RESOURCE_FORMAT_GATHER_UNSUPPORTED => 416

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_INVALID_USE_OF_CENTER_MULTISAMPLE_PATTERN => 417

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_IASETVERTEXBUFFERS_STRIDE_TOO_LARGE => 418

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_IASETVERTEXBUFFERS_INVALIDRANGE => 419

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_EMPTY_LAYOUT => 420

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_RESOURCE_SAMPLE_COUNT_MISMATCH => 421

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_OBJECT_SUMMARY => 422

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_BUFFER => 423

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_TEXTURE1D => 424

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_TEXTURE2D => 425

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_TEXTURE3D => 426

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_SHADERRESOURCEVIEW => 427

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_RENDERTARGETVIEW => 428

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_DEPTHSTENCILVIEW => 429

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_VERTEXSHADER => 430

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_GEOMETRYSHADER => 431

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_PIXELSHADER => 432

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_INPUTLAYOUT => 433

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_SAMPLER => 434

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_BLENDSTATE => 435

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_DEPTHSTENCILSTATE => 436

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_RASTERIZERSTATE => 437

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_QUERY => 438

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_PREDICATE => 439

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_COUNTER => 440

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_DEVICE => 441

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_SWAPCHAIN => 442

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_D3D10_MESSAGES_END => 443

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_D3D10L9_MESSAGES_START => 1048576

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_STENCIL_NO_TWO_SIDED => 1048577

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERASTERIZERSTATE_DepthBiasClamp_NOT_SUPPORTED => 1048578

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_NO_COMPARISON_SUPPORT => 1048579

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_EXCESSIVE_ANISOTROPY => 1048580

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_BORDER_OUT_OF_RANGE => 1048581

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VSSETSAMPLERS_NOT_SUPPORTED => 1048582

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VSSETSAMPLERS_TOO_MANY_SAMPLERS => 1048583

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_PSSETSAMPLERS_TOO_MANY_SAMPLERS => 1048584

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERESOURCE_NO_ARRAYS => 1048585

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERESOURCE_NO_VB_AND_IB_BIND => 1048586

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERESOURCE_NO_TEXTURE_1D => 1048587

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERESOURCE_DIMENSION_OUT_OF_RANGE => 1048588

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERESOURCE_NOT_BINDABLE_AS_SHADER_RESOURCE => 1048589

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_OMSETRENDERTARGETS_TOO_MANY_RENDER_TARGETS => 1048590

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_OMSETRENDERTARGETS_NO_DIFFERING_BIT_DEPTHS => 1048591

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_IASETVERTEXBUFFERS_BAD_BUFFER_INDEX => 1048592

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_RSSETVIEWPORTS_TOO_MANY_VIEWPORTS => 1048593

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_IASETPRIMITIVETOPOLOGY_ADJACENCY_UNSUPPORTED => 1048594

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_RSSETSCISSORRECTS_TOO_MANY_SCISSORS => 1048595

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYRESOURCE_ONLY_TEXTURE_2D_WITHIN_GPU_MEMORY => 1048596

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYRESOURCE_NO_TEXTURE_3D_READBACK => 1048597

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYRESOURCE_NO_TEXTURE_ONLY_READBACK => 1048598

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_UNSUPPORTED_FORMAT => 1048599

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBLENDSTATE_NO_ALPHA_TO_COVERAGE => 1048600

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERASTERIZERSTATE_DepthClipEnable_MUST_BE_TRUE => 1048601

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DRAWINDEXED_STARTINDEXLOCATION_MUST_BE_POSITIVE => 1048602

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESHADERRESOURCEVIEW_MUST_USE_LOWEST_LOD => 1048603

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_MINLOD_MUST_NOT_BE_FRACTIONAL => 1048604

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_MAXLOD_MUST_BE_FLT_MAX => 1048605

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESHADERRESOURCEVIEW_FIRSTARRAYSLICE_MUST_BE_ZERO => 1048606

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESHADERRESOURCEVIEW_CUBES_MUST_HAVE_6_SIDES => 1048607

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERESOURCE_NOT_BINDABLE_AS_RENDER_TARGET => 1048608

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERESOURCE_NO_DWORD_INDEX_BUFFER => 1048609

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERESOURCE_MSAA_PRECLUDES_SHADER_RESOURCE => 1048610

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERESOURCE_PRESENTATION_PRECLUDES_SHADER_RESOURCE => 1048611

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBLENDSTATE_NO_INDEPENDENT_BLEND_ENABLE => 1048612

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBLENDSTATE_NO_INDEPENDENT_WRITE_MASKS => 1048613

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERESOURCE_NO_STREAM_OUT => 1048614

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERESOURCE_ONLY_VB_IB_FOR_BUFFERS => 1048615

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERESOURCE_NO_AUTOGEN_FOR_VOLUMES => 1048616

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERESOURCE_DXGI_FORMAT_R8G8B8A8_CANNOT_BE_SHARED => 1048617

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VSSHADERRESOURCES_NOT_SUPPORTED => 1048618

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GEOMETRY_SHADER_NOT_SUPPORTED => 1048619

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_STREAM_OUT_NOT_SUPPORTED => 1048620

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TEXT_FILTER_NOT_SUPPORTED => 1048621

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBLENDSTATE_NO_SEPARATE_ALPHA_BLEND => 1048622

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBLENDSTATE_NO_MRT_BLEND => 1048623

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBLENDSTATE_OPERATION_NOT_SUPPORTED => 1048624

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_NO_MIRRORONCE => 1048625

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DRAWINSTANCED_NOT_SUPPORTED => 1048626

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DRAWINDEXEDINSTANCED_NOT_SUPPORTED_BELOW_9_3 => 1048627

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DRAWINDEXED_POINTLIST_UNSUPPORTED => 1048628

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SETBLENDSTATE_SAMPLE_MASK_CANNOT_BE_ZERO => 1048629

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERESOURCE_DIMENSION_EXCEEDS_FEATURE_LEVEL_DEFINITION => 1048630

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERESOURCE_ONLY_SINGLE_MIP_LEVEL_DEPTH_STENCIL_SUPPORTED => 1048631

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_RSSETSCISSORRECTS_NEGATIVESCISSOR => 1048632

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SLOT_ZERO_MUST_BE_D3D10_INPUT_PER_VERTEX_DATA => 1048633

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERESOURCE_NON_POW_2_MIPMAP => 1048634

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESAMPLERSTATE_BORDER_NOT_SUPPORTED => 1048635

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_OMSETRENDERTARGETS_NO_SRGB_MRT => 1048636

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYRESOURCE_NO_3D_MISMATCHED_UPDATES => 1048637

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_D3D10L9_MESSAGES_END => 1048638

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_D3D11_MESSAGES_START => 2097152

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_INVALIDFLAGS => 2097153

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVERTEXSHADER_INVALIDCLASSLINKAGE => 2097154

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADER_INVALIDCLASSLINKAGE => 2097155

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDNUMSTREAMS => 2097156

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSTREAMTORASTERIZER => 2097157

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UNEXPECTEDSTREAMS => 2097158

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDCLASSLINKAGE => 2097159

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEPIXELSHADER_INVALIDCLASSLINKAGE => 2097160

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEFERREDCONTEXT_INVALID_COMMANDLISTFLAGS => 2097161

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEFERREDCONTEXT_SINGLETHREADED => 2097162

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEFERREDCONTEXT_INVALIDARG_RETURN => 2097163

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEFERREDCONTEXT_INVALID_CALL_RETURN => 2097164

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEFERREDCONTEXT_OUTOFMEMORY_RETURN => 2097165

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_FINISHDISPLAYLIST_ONIMMEDIATECONTEXT => 2097166

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_FINISHDISPLAYLIST_OUTOFMEMORY_RETURN => 2097167

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_FINISHDISPLAYLIST_INVALID_CALL_RETURN => 2097168

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSTREAM => 2097169

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UNEXPECTEDENTRIES => 2097170

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UNEXPECTEDSTRIDES => 2097171

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDNUMSTRIDES => 2097172

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_HSSETSHADERRESOURCES_HAZARD => 2097173

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_HSSETCONSTANTBUFFERS_HAZARD => 2097174

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_HSSETSHADERRESOURCES_UNBINDDELETINGOBJECT => 2097175

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_HSSETCONSTANTBUFFERS_UNBINDDELETINGOBJECT => 2097176

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEHULLSHADER_INVALIDCALL => 2097177

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEHULLSHADER_OUTOFMEMORY => 2097178

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEHULLSHADER_INVALIDSHADERBYTECODE => 2097179

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEHULLSHADER_INVALIDSHADERTYPE => 2097180

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEHULLSHADER_INVALIDCLASSLINKAGE => 2097181

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_HSSETSHADERRESOURCES_VIEWS_EMPTY => 2097182

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_HSSETCONSTANTBUFFERS_INVALIDBUFFER => 2097183

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_HSSETCONSTANTBUFFERS_BUFFERS_EMPTY => 2097184

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_HSSETSAMPLERS_SAMPLERS_EMPTY => 2097185

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_HSGETSHADERRESOURCES_VIEWS_EMPTY => 2097186

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_HSGETCONSTANTBUFFERS_BUFFERS_EMPTY => 2097187

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_HSGETSAMPLERS_SAMPLERS_EMPTY => 2097188

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DSSETSHADERRESOURCES_HAZARD => 2097189

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DSSETCONSTANTBUFFERS_HAZARD => 2097190

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DSSETSHADERRESOURCES_UNBINDDELETINGOBJECT => 2097191

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DSSETCONSTANTBUFFERS_UNBINDDELETINGOBJECT => 2097192

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDOMAINSHADER_INVALIDCALL => 2097193

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDOMAINSHADER_OUTOFMEMORY => 2097194

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDOMAINSHADER_INVALIDSHADERBYTECODE => 2097195

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDOMAINSHADER_INVALIDSHADERTYPE => 2097196

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDOMAINSHADER_INVALIDCLASSLINKAGE => 2097197

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DSSETSHADERRESOURCES_VIEWS_EMPTY => 2097198

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DSSETCONSTANTBUFFERS_INVALIDBUFFER => 2097199

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DSSETCONSTANTBUFFERS_BUFFERS_EMPTY => 2097200

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DSSETSAMPLERS_SAMPLERS_EMPTY => 2097201

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DSGETSHADERRESOURCES_VIEWS_EMPTY => 2097202

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DSGETCONSTANTBUFFERS_BUFFERS_EMPTY => 2097203

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DSGETSAMPLERS_SAMPLERS_EMPTY => 2097204

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_HS_XOR_DS_MISMATCH => 2097205

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEFERRED_CONTEXT_REMOVAL_PROCESS_AT_FAULT => 2097206

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAWINDIRECT_INVALID_ARG_BUFFER => 2097207

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAWINDIRECT_OFFSET_UNALIGNED => 2097208

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAWINDIRECT_OFFSET_OVERFLOW => 2097209

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RESOURCE_MAP_INVALIDMAPTYPE => 2097210

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RESOURCE_MAP_INVALIDSUBRESOURCE => 2097211

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RESOURCE_MAP_INVALIDFLAGS => 2097212

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RESOURCE_MAP_ALREADYMAPPED => 2097213

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RESOURCE_MAP_DEVICEREMOVED_RETURN => 2097214

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RESOURCE_MAP_OUTOFMEMORY_RETURN => 2097215

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RESOURCE_MAP_WITHOUT_INITIAL_DISCARD => 2097216

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RESOURCE_UNMAP_INVALIDSUBRESOURCE => 2097217

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RESOURCE_UNMAP_NOTMAPPED => 2097218

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_RASTERIZING_CONTROL_POINTS => 2097219

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_IASETPRIMITIVETOPOLOGY_TOPOLOGY_UNSUPPORTED => 2097220

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_HS_DS_SIGNATURE_MISMATCH => 2097221

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_HULL_SHADER_INPUT_TOPOLOGY_MISMATCH => 2097222

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_HS_DS_CONTROL_POINT_COUNT_MISMATCH => 2097223

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_HS_DS_TESSELLATOR_DOMAIN_MISMATCH => 2097224

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_CONTEXT => 2097225

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_CONTEXT => 2097226

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_CONTEXT => 2097227

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_BUFFER => 2097228

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_BUFFER_WIN7 => 2097229

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_BUFFER => 2097230

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_TEXTURE1D => 2097231

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_TEXTURE1D_WIN7 => 2097232

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_TEXTURE1D => 2097233

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_TEXTURE2D => 2097234

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_TEXTURE2D_WIN7 => 2097235

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_TEXTURE2D => 2097236

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_TEXTURE3D => 2097237

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_TEXTURE3D_WIN7 => 2097238

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_TEXTURE3D => 2097239

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_SHADERRESOURCEVIEW => 2097240

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_SHADERRESOURCEVIEW_WIN7 => 2097241

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_SHADERRESOURCEVIEW => 2097242

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_RENDERTARGETVIEW => 2097243

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_RENDERTARGETVIEW_WIN7 => 2097244

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_RENDERTARGETVIEW => 2097245

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_DEPTHSTENCILVIEW => 2097246

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_DEPTHSTENCILVIEW_WIN7 => 2097247

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_DEPTHSTENCILVIEW => 2097248

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_VERTEXSHADER => 2097249

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_VERTEXSHADER_WIN7 => 2097250

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_VERTEXSHADER => 2097251

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_HULLSHADER => 2097252

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_HULLSHADER => 2097253

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_HULLSHADER => 2097254

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_DOMAINSHADER => 2097255

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_DOMAINSHADER => 2097256

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_DOMAINSHADER => 2097257

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_GEOMETRYSHADER => 2097258

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_GEOMETRYSHADER_WIN7 => 2097259

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_GEOMETRYSHADER => 2097260

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_PIXELSHADER => 2097261

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_PIXELSHADER_WIN7 => 2097262

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_PIXELSHADER => 2097263

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_INPUTLAYOUT => 2097264

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_INPUTLAYOUT_WIN7 => 2097265

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_INPUTLAYOUT => 2097266

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_SAMPLER => 2097267

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_SAMPLER_WIN7 => 2097268

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_SAMPLER => 2097269

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_BLENDSTATE => 2097270

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_BLENDSTATE_WIN7 => 2097271

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_BLENDSTATE => 2097272

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_DEPTHSTENCILSTATE => 2097273

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_DEPTHSTENCILSTATE_WIN7 => 2097274

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_DEPTHSTENCILSTATE => 2097275

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_RASTERIZERSTATE => 2097276

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_RASTERIZERSTATE_WIN7 => 2097277

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_RASTERIZERSTATE => 2097278

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_QUERY => 2097279

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_QUERY_WIN7 => 2097280

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_QUERY => 2097281

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_PREDICATE => 2097282

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_PREDICATE_WIN7 => 2097283

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_PREDICATE => 2097284

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_COUNTER => 2097285

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_COUNTER => 2097286

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_COMMANDLIST => 2097287

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_COMMANDLIST => 2097288

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_COMMANDLIST => 2097289

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_CLASSINSTANCE => 2097290

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_CLASSINSTANCE => 2097291

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_CLASSINSTANCE => 2097292

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_CLASSLINKAGE => 2097293

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_CLASSLINKAGE => 2097294

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_CLASSLINKAGE => 2097295

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_DEVICE_WIN7 => 2097296

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_OBJECT_SUMMARY_WIN7 => 2097297

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_COMPUTESHADER => 2097298

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_COMPUTESHADER => 2097299

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_COMPUTESHADER => 2097300

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_UNORDEREDACCESSVIEW => 2097301

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_UNORDEREDACCESSVIEW => 2097302

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_UNORDEREDACCESSVIEW => 2097303

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SETSHADER_INTERFACES_FEATURELEVEL => 2097304

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SETSHADER_INTERFACE_COUNT_MISMATCH => 2097305

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SETSHADER_INVALID_INSTANCE => 2097306

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SETSHADER_INVALID_INSTANCE_INDEX => 2097307

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SETSHADER_INVALID_INSTANCE_TYPE => 2097308

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SETSHADER_INVALID_INSTANCE_DATA => 2097309

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SETSHADER_UNBOUND_INSTANCE_DATA => 2097310

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SETSHADER_INSTANCE_DATA_BINDINGS => 2097311

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATESHADER_CLASSLINKAGE_FULL => 2097312

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CHECKFEATURESUPPORT_UNRECOGNIZED_FEATURE => 2097313

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CHECKFEATURESUPPORT_MISMATCHED_DATA_SIZE => 2097314

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CHECKFEATURESUPPORT_INVALIDARG_RETURN => 2097315

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CSSETSHADERRESOURCES_HAZARD => 2097316

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CSSETCONSTANTBUFFERS_HAZARD => 2097317

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CSSETSHADERRESOURCES_UNBINDDELETINGOBJECT => 2097318

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CSSETCONSTANTBUFFERS_UNBINDDELETINGOBJECT => 2097319

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATECOMPUTESHADER_INVALIDCALL => 2097320

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATECOMPUTESHADER_OUTOFMEMORY => 2097321

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATECOMPUTESHADER_INVALIDSHADERBYTECODE => 2097322

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATECOMPUTESHADER_INVALIDSHADERTYPE => 2097323

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATECOMPUTESHADER_INVALIDCLASSLINKAGE => 2097324

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CSSETSHADERRESOURCES_VIEWS_EMPTY => 2097325

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CSSETCONSTANTBUFFERS_INVALIDBUFFER => 2097326

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CSSETCONSTANTBUFFERS_BUFFERS_EMPTY => 2097327

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CSSETSAMPLERS_SAMPLERS_EMPTY => 2097328

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CSGETSHADERRESOURCES_VIEWS_EMPTY => 2097329

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CSGETCONSTANTBUFFERS_BUFFERS_EMPTY => 2097330

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CSGETSAMPLERS_SAMPLERS_EMPTY => 2097331

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEVERTEXSHADER_DOUBLEFLOATOPSNOTSUPPORTED => 2097332

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEHULLSHADER_DOUBLEFLOATOPSNOTSUPPORTED => 2097333

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEDOMAINSHADER_DOUBLEFLOATOPSNOTSUPPORTED => 2097334

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEGEOMETRYSHADER_DOUBLEFLOATOPSNOTSUPPORTED => 2097335

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_DOUBLEFLOATOPSNOTSUPPORTED => 2097336

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEPIXELSHADER_DOUBLEFLOATOPSNOTSUPPORTED => 2097337

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATECOMPUTESHADER_DOUBLEFLOATOPSNOTSUPPORTED => 2097338

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_INVALIDSTRUCTURESTRIDE => 2097339

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDFLAGS => 2097340

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_INVALIDRESOURCE => 2097341

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_INVALIDDESC => 2097342

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_INVALIDFORMAT => 2097343

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_INVALIDDIMENSIONS => 2097344

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_UNRECOGNIZEDFORMAT => 2097345

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_OMSETRENDERTARGETSANDUNORDEREDACCESSVIEWS_HAZARD => 2097346

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_OMSETRENDERTARGETSANDUNORDEREDACCESSVIEWS_OVERLAPPING_OLD_SLOTS => 2097347

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_OMSETRENDERTARGETSANDUNORDEREDACCESSVIEWS_NO_OP => 2097348

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CSSETUNORDEREDACCESSVIEWS_UNBINDDELETINGOBJECT => 2097349

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_PSSETUNORDEREDACCESSVIEWS_UNBINDDELETINGOBJECT => 2097350

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_INVALIDARG_RETURN => 2097351

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_OUTOFMEMORY_RETURN => 2097352

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_TOOMANYOBJECTS => 2097353

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CSSETUNORDEREDACCESSVIEWS_HAZARD => 2097354

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CLEARUNORDEREDACCESSVIEW_DENORMFLUSH => 2097355

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CSSETUNORDEREDACCESSS_VIEWS_EMPTY => 2097356

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CSGETUNORDEREDACCESSS_VIEWS_EMPTY => 2097357

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_INVALIDFLAGS => 2097358

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESHADERRESESOURCEVIEW_TOOMANYOBJECTS => 2097359

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DISPATCHINDIRECT_INVALID_ARG_BUFFER => 2097360

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DISPATCHINDIRECT_OFFSET_UNALIGNED => 2097361

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DISPATCHINDIRECT_OFFSET_OVERFLOW => 2097362

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SETRESOURCEMINLOD_INVALIDCONTEXT => 2097363

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SETRESOURCEMINLOD_INVALIDRESOURCE => 2097364

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SETRESOURCEMINLOD_INVALIDMINLOD => 2097365

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_GETRESOURCEMINLOD_INVALIDCONTEXT => 2097366

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_GETRESOURCEMINLOD_INVALIDRESOURCE => 2097367

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_OMSETDEPTHSTENCIL_UNBINDDELETINGOBJECT => 2097368

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CLEARDEPTHSTENCILVIEW_DEPTH_READONLY => 2097369

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CLEARDEPTHSTENCILVIEW_STENCIL_READONLY => 2097370

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CHECKFEATURESUPPORT_FORMAT_DEPRECATED => 2097371

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_RETURN_TYPE_MISMATCH => 2097372

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_NOT_SET => 2097373

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_UNORDEREDACCESSVIEW_RENDERTARGETVIEW_OVERLAP => 2097374

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_DIMENSION_MISMATCH => 2097375

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_APPEND_UNSUPPORTED => 2097376

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_ATOMICS_UNSUPPORTED => 2097377

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_STRUCTURE_STRIDE_MISMATCH => 2097378

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_BUFFER_TYPE_MISMATCH => 2097379

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_RAW_UNSUPPORTED => 2097380

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_FORMAT_LD_UNSUPPORTED => 2097381

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_FORMAT_STORE_UNSUPPORTED => 2097382

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_ATOMIC_ADD_UNSUPPORTED => 2097383

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_ATOMIC_BITWISE_OPS_UNSUPPORTED => 2097384

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_ATOMIC_CMPSTORE_CMPEXCHANGE_UNSUPPORTED => 2097385

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_ATOMIC_EXCHANGE_UNSUPPORTED => 2097386

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_ATOMIC_SIGNED_MINMAX_UNSUPPORTED => 2097387

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_ATOMIC_UNSIGNED_MINMAX_UNSUPPORTED => 2097388

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DISPATCH_BOUND_RESOURCE_MAPPED => 2097389

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DISPATCH_THREADGROUPCOUNT_OVERFLOW => 2097390

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DISPATCH_THREADGROUPCOUNT_ZERO => 2097391

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SHADERRESOURCEVIEW_STRUCTURE_STRIDE_MISMATCH => 2097392

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SHADERRESOURCEVIEW_BUFFER_TYPE_MISMATCH => 2097393

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SHADERRESOURCEVIEW_RAW_UNSUPPORTED => 2097394

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DISPATCH_UNSUPPORTED => 2097395

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DISPATCHINDIRECT_UNSUPPORTED => 2097396

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYSTRUCTURECOUNT_INVALIDOFFSET => 2097397

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYSTRUCTURECOUNT_LARGEOFFSET => 2097398

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYSTRUCTURECOUNT_INVALIDDESTINATIONSTATE => 2097399

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYSTRUCTURECOUNT_INVALIDSOURCESTATE => 2097400

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CHECKFORMATSUPPORT_FORMAT_NOT_SUPPORTED => 2097401

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CSSETUNORDEREDACCESSVIEWS_INVALIDVIEW => 2097402

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CSSETUNORDEREDACCESSVIEWS_INVALIDOFFSET => 2097403

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CSSETUNORDEREDACCESSVIEWS_TOOMANYVIEWS => 2097404

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CLEARUNORDEREDACCESSVIEWFLOAT_INVALIDFORMAT => 2097405

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_COUNTER_UNSUPPORTED => 2097406

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_REF_WARNING => 2097407

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_PIXEL_SHADER_WITHOUT_RTV_OR_DSV => 2097408

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SHADER_ABORT => 2097409

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SHADER_MESSAGE => 2097410

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SHADER_ERROR => 2097411

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_OFFERRESOURCES_INVALIDRESOURCE => 2097412

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_HSSETSAMPLERS_UNBINDDELETINGOBJECT => 2097413

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DSSETSAMPLERS_UNBINDDELETINGOBJECT => 2097414

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CSSETSAMPLERS_UNBINDDELETINGOBJECT => 2097415

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_HSSETSHADER_UNBINDDELETINGOBJECT => 2097416

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DSSETSHADER_UNBINDDELETINGOBJECT => 2097417

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CSSETSHADER_UNBINDDELETINGOBJECT => 2097418

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ENQUEUESETEVENT_INVALIDARG_RETURN => 2097419

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ENQUEUESETEVENT_OUTOFMEMORY_RETURN => 2097420

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ENQUEUESETEVENT_ACCESSDENIED_RETURN => 2097421

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_OMSETRENDERTARGETSANDUNORDEREDACCESSVIEWS_NUMUAVS_INVALIDRANGE => 2097422

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_USE_OF_ZERO_REFCOUNT_OBJECT => 2097423

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_D3D11_MESSAGES_END => 2097424

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_D3D11_1_MESSAGES_START => 3145728

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_VIDEODECODER => 3145729

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_VIDEOPROCESSORENUM => 3145730

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_VIDEOPROCESSOR => 3145731

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_DECODEROUTPUTVIEW => 3145732

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_PROCESSORINPUTVIEW => 3145733

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_PROCESSOROUTPUTVIEW => 3145734

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_DEVICECONTEXTSTATE => 3145735

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_VIDEODECODER => 3145736

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_VIDEOPROCESSORENUM => 3145737

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_VIDEOPROCESSOR => 3145738

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_DECODEROUTPUTVIEW => 3145739

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_PROCESSORINPUTVIEW => 3145740

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_PROCESSOROUTPUTVIEW => 3145741

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_DEVICECONTEXTSTATE => 3145742

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_VIDEODECODER => 3145743

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_VIDEOPROCESSORENUM => 3145744

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_VIDEOPROCESSOR => 3145745

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_DECODEROUTPUTVIEW => 3145746

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_PROCESSORINPUTVIEW => 3145747

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_PROCESSOROUTPUTVIEW => 3145748

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_DEVICECONTEXTSTATE => 3145749

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEVICECONTEXTSTATE_INVALIDFLAGS => 3145750

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEVICECONTEXTSTATE_INVALIDFEATURELEVEL => 3145751

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEVICECONTEXTSTATE_FEATURELEVELS_NOT_SUPPORTED => 3145752

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEVICECONTEXTSTATE_INVALIDREFIID => 3145753

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DISCARDVIEW_INVALIDVIEW => 3145754

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYSUBRESOURCEREGION1_INVALIDCOPYFLAGS => 3145755

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_UPDATESUBRESOURCE1_INVALIDCOPYFLAGS => 3145756

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERASTERIZERSTATE_INVALIDFORCEDSAMPLECOUNT => 3145757

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEODECODER_OUTOFMEMORY_RETURN => 3145758

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEODECODER_NULLPARAM => 3145759

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEODECODER_INVALIDFORMAT => 3145760

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEODECODER_ZEROWIDTHHEIGHT => 3145761

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEODECODER_DRIVER_INVALIDBUFFERSIZE => 3145762

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEODECODER_DRIVER_INVALIDBUFFERUSAGE => 3145763

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEODECODERPROFILECOUNT_OUTOFMEMORY => 3145764

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEODECODERPROFILE_NULLPARAM => 3145765

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEODECODERPROFILE_INVALIDINDEX => 3145766

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEODECODERPROFILE_OUTOFMEMORY_RETURN => 3145767

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CHECKVIDEODECODERFORMAT_NULLPARAM => 3145768

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CHECKVIDEODECODERFORMAT_OUTOFMEMORY_RETURN => 3145769

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEODECODERCONFIGCOUNT_NULLPARAM => 3145770

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEODECODERCONFIGCOUNT_OUTOFMEMORY_RETURN => 3145771

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEODECODERCONFIG_NULLPARAM => 3145772

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEODECODERCONFIG_INVALIDINDEX => 3145773

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEODECODERCONFIG_OUTOFMEMORY_RETURN => 3145774

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETDECODERCREATIONPARAMS_NULLPARAM => 3145775

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETDECODERDRIVERHANDLE_NULLPARAM => 3145776

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETDECODERBUFFER_NULLPARAM => 3145777

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETDECODERBUFFER_INVALIDBUFFER => 3145778

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETDECODERBUFFER_INVALIDTYPE => 3145779

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETDECODERBUFFER_LOCKED => 3145780

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RELEASEDECODERBUFFER_NULLPARAM => 3145781

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RELEASEDECODERBUFFER_INVALIDTYPE => 3145782

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RELEASEDECODERBUFFER_NOTLOCKED => 3145783

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECODERBEGINFRAME_NULLPARAM => 3145784

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECODERBEGINFRAME_HAZARD => 3145785

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECODERENDFRAME_NULLPARAM => 3145786

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SUBMITDECODERBUFFERS_NULLPARAM => 3145787

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SUBMITDECODERBUFFERS_INVALIDTYPE => 3145788

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECODEREXTENSION_NULLPARAM => 3145789

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECODEREXTENSION_INVALIDRESOURCE => 3145790

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORENUMERATOR_OUTOFMEMORY_RETURN => 3145791

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORENUMERATOR_NULLPARAM => 3145792

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORENUMERATOR_INVALIDFRAMEFORMAT => 3145793

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORENUMERATOR_INVALIDUSAGE => 3145794

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORENUMERATOR_INVALIDINPUTFRAMERATE => 3145795

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORENUMERATOR_INVALIDOUTPUTFRAMERATE => 3145796

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORENUMERATOR_INVALIDWIDTHHEIGHT => 3145797

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEOPROCESSORCONTENTDESC_NULLPARAM => 3145798

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CHECKVIDEOPROCESSORFORMAT_NULLPARAM => 3145799

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEOPROCESSORCAPS_NULLPARAM => 3145800

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEOPROCESSORRATECONVERSIONCAPS_NULLPARAM => 3145801

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEOPROCESSORRATECONVERSIONCAPS_INVALIDINDEX => 3145802

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEOPROCESSORCUSTOMRATE_NULLPARAM => 3145803

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEOPROCESSORCUSTOMRATE_INVALIDINDEX => 3145804

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEOPROCESSORFILTERRANGE_NULLPARAM => 3145805

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEOPROCESSORFILTERRANGE_UNSUPPORTED => 3145806

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSOR_OUTOFMEMORY_RETURN => 3145807

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSOR_NULLPARAM => 3145808

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTTARGETRECT_NULLPARAM => 3145809

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTBACKGROUNDCOLOR_NULLPARAM => 3145810

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTBACKGROUNDCOLOR_INVALIDALPHA => 3145811

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTCOLORSPACE_NULLPARAM => 3145812

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTALPHAFILLMODE_NULLPARAM => 3145813

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTALPHAFILLMODE_UNSUPPORTED => 3145814

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTALPHAFILLMODE_INVALIDSTREAM => 3145815

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTALPHAFILLMODE_INVALIDFILLMODE => 3145816

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTCONSTRICTION_NULLPARAM => 3145817

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTSTEREOMODE_NULLPARAM => 3145818

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTSTEREOMODE_UNSUPPORTED => 3145819

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTEXTENSION_NULLPARAM => 3145820

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETOUTPUTTARGETRECT_NULLPARAM => 3145821

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETOUTPUTBACKGROUNDCOLOR_NULLPARAM => 3145822

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETOUTPUTCOLORSPACE_NULLPARAM => 3145823

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETOUTPUTALPHAFILLMODE_NULLPARAM => 3145824

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETOUTPUTCONSTRICTION_NULLPARAM => 3145825

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTCONSTRICTION_UNSUPPORTED => 3145826

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTCONSTRICTION_INVALIDSIZE => 3145827

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETOUTPUTSTEREOMODE_NULLPARAM => 3145828

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETOUTPUTEXTENSION_NULLPARAM => 3145829

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMFRAMEFORMAT_NULLPARAM => 3145830

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMFRAMEFORMAT_INVALIDFORMAT => 3145831

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMFRAMEFORMAT_INVALIDSTREAM => 3145832

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMCOLORSPACE_NULLPARAM => 3145833

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMCOLORSPACE_INVALIDSTREAM => 3145834

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMOUTPUTRATE_NULLPARAM => 3145835

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMOUTPUTRATE_INVALIDRATE => 3145836

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMOUTPUTRATE_INVALIDFLAG => 3145837

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMOUTPUTRATE_INVALIDSTREAM => 3145838

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMSOURCERECT_NULLPARAM => 3145839

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMSOURCERECT_INVALIDSTREAM => 3145840

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMSOURCERECT_INVALIDRECT => 3145841

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMDESTRECT_NULLPARAM => 3145842

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMDESTRECT_INVALIDSTREAM => 3145843

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMDESTRECT_INVALIDRECT => 3145844

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMALPHA_NULLPARAM => 3145845

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMALPHA_INVALIDSTREAM => 3145846

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMALPHA_INVALIDALPHA => 3145847

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMPALETTE_NULLPARAM => 3145848

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMPALETTE_INVALIDSTREAM => 3145849

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMPALETTE_INVALIDCOUNT => 3145850

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMPALETTE_INVALIDALPHA => 3145851

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMPIXELASPECTRATIO_NULLPARAM => 3145852

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMPIXELASPECTRATIO_INVALIDSTREAM => 3145853

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMPIXELASPECTRATIO_INVALIDRATIO => 3145854

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMLUMAKEY_NULLPARAM => 3145855

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMLUMAKEY_INVALIDSTREAM => 3145856

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMLUMAKEY_INVALIDRANGE => 3145857

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMLUMAKEY_UNSUPPORTED => 3145858

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMSTEREOFORMAT_NULLPARAM => 3145859

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMSTEREOFORMAT_INVALIDSTREAM => 3145860

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMSTEREOFORMAT_UNSUPPORTED => 3145861

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMSTEREOFORMAT_FLIPUNSUPPORTED => 3145862

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMSTEREOFORMAT_MONOOFFSETUNSUPPORTED => 3145863

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMSTEREOFORMAT_FORMATUNSUPPORTED => 3145864

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMSTEREOFORMAT_INVALIDFORMAT => 3145865

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMAUTOPROCESSINGMODE_NULLPARAM => 3145866

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMAUTOPROCESSINGMODE_INVALIDSTREAM => 3145867

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMFILTER_NULLPARAM => 3145868

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMFILTER_INVALIDSTREAM => 3145869

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMFILTER_INVALIDFILTER => 3145870

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMFILTER_UNSUPPORTED => 3145871

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMFILTER_INVALIDLEVEL => 3145872

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMEXTENSION_NULLPARAM => 3145873

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMEXTENSION_INVALIDSTREAM => 3145874

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMFRAMEFORMAT_NULLPARAM => 3145875

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMCOLORSPACE_NULLPARAM => 3145876

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMOUTPUTRATE_NULLPARAM => 3145877

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMSOURCERECT_NULLPARAM => 3145878

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMDESTRECT_NULLPARAM => 3145879

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMALPHA_NULLPARAM => 3145880

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMPALETTE_NULLPARAM => 3145881

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMPIXELASPECTRATIO_NULLPARAM => 3145882

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMLUMAKEY_NULLPARAM => 3145883

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMSTEREOFORMAT_NULLPARAM => 3145884

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMAUTOPROCESSINGMODE_NULLPARAM => 3145885

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMFILTER_NULLPARAM => 3145886

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMEXTENSION_NULLPARAM => 3145887

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMEXTENSION_INVALIDSTREAM => 3145888

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_NULLPARAM => 3145889

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_INVALIDSTREAMCOUNT => 3145890

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_TARGETRECT => 3145891

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_INVALIDOUTPUT => 3145892

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_INVALIDPASTFRAMES => 3145893

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_INVALIDFUTUREFRAMES => 3145894

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_INVALIDSOURCERECT => 3145895

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_INVALIDDESTRECT => 3145896

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_INVALIDINPUTRESOURCE => 3145897

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_INVALIDARRAYSIZE => 3145898

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_INVALIDARRAY => 3145899

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_RIGHTEXPECTED => 3145900

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_RIGHTNOTEXPECTED => 3145901

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_STEREONOTENABLED => 3145902

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_INVALIDRIGHTRESOURCE => 3145903

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_NOSTEREOSTREAMS => 3145904

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_INPUTHAZARD => 3145905

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORBLT_OUTPUTHAZARD => 3145906

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEODECODEROUTPUTVIEW_OUTOFMEMORY_RETURN => 3145907

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEODECODEROUTPUTVIEW_NULLPARAM => 3145908

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEODECODEROUTPUTVIEW_INVALIDTYPE => 3145909

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEODECODEROUTPUTVIEW_INVALIDBIND => 3145910

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEODECODEROUTPUTVIEW_UNSUPPORTEDFORMAT => 3145911

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEODECODEROUTPUTVIEW_INVALIDMIP => 3145912

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEODECODEROUTPUTVIEW_UNSUPPORTEMIP => 3145913

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEODECODEROUTPUTVIEW_INVALIDARRAYSIZE => 3145914

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEODECODEROUTPUTVIEW_INVALIDARRAY => 3145915

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEODECODEROUTPUTVIEW_INVALIDDIMENSION => 3145916

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORINPUTVIEW_OUTOFMEMORY_RETURN => 3145917

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORINPUTVIEW_NULLPARAM => 3145918

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORINPUTVIEW_INVALIDTYPE => 3145919

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORINPUTVIEW_INVALIDBIND => 3145920

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORINPUTVIEW_INVALIDMISC => 3145921

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORINPUTVIEW_INVALIDUSAGE => 3145922

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORINPUTVIEW_INVALIDFORMAT => 3145923

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORINPUTVIEW_INVALIDFOURCC => 3145924

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORINPUTVIEW_INVALIDMIP => 3145925

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORINPUTVIEW_UNSUPPORTEDMIP => 3145926

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORINPUTVIEW_INVALIDARRAYSIZE => 3145927

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORINPUTVIEW_INVALIDARRAY => 3145928

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORINPUTVIEW_INVALIDDIMENSION => 3145929

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSOROUTPUTVIEW_OUTOFMEMORY_RETURN => 3145930

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSOROUTPUTVIEW_NULLPARAM => 3145931

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSOROUTPUTVIEW_INVALIDTYPE => 3145932

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSOROUTPUTVIEW_INVALIDBIND => 3145933

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSOROUTPUTVIEW_INVALIDFORMAT => 3145934

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSOROUTPUTVIEW_INVALIDMIP => 3145935

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSOROUTPUTVIEW_UNSUPPORTEDMIP => 3145936

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSOROUTPUTVIEW_UNSUPPORTEDARRAY => 3145937

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSOROUTPUTVIEW_INVALIDARRAY => 3145938

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSOROUTPUTVIEW_INVALIDDIMENSION => 3145939

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_INVALID_USE_OF_FORCED_SAMPLE_COUNT => 3145940

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBLENDSTATE_INVALIDLOGICOPS => 3145941

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDDARRAYWITHDECODER => 3145942

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_INVALIDDARRAYWITHDECODER => 3145943

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDDARRAYWITHDECODER => 3145944

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_LOCKEDOUT_INTERFACE => 3145945

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_REF_WARNING_ATOMIC_INCONSISTENT => 3145946

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_REF_WARNING_READING_UNINITIALIZED_RESOURCE => 3145947

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_REF_WARNING_RAW_HAZARD => 3145948

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_REF_WARNING_WAR_HAZARD => 3145949

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_REF_WARNING_WAW_HAZARD => 3145950

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATECRYPTOSESSION_NULLPARAM => 3145951

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATECRYPTOSESSION_OUTOFMEMORY_RETURN => 3145952

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETCRYPTOTYPE_NULLPARAM => 3145953

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETDECODERPROFILE_NULLPARAM => 3145954

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETCRYPTOSESSIONCERTIFICATESIZE_NULLPARAM => 3145955

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETCRYPTOSESSIONCERTIFICATE_NULLPARAM => 3145956

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETCRYPTOSESSIONCERTIFICATE_WRONGSIZE => 3145957

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETCRYPTOSESSIONHANDLE_WRONGSIZE => 3145958

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_NEGOTIATECRPYTOSESSIONKEYEXCHANGE_NULLPARAM => 3145959

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ENCRYPTIONBLT_UNSUPPORTED => 3145960

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ENCRYPTIONBLT_NULLPARAM => 3145961

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ENCRYPTIONBLT_SRC_WRONGDEVICE => 3145962

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ENCRYPTIONBLT_DST_WRONGDEVICE => 3145963

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ENCRYPTIONBLT_FORMAT_MISMATCH => 3145964

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ENCRYPTIONBLT_SIZE_MISMATCH => 3145965

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ENCRYPTIONBLT_SRC_MULTISAMPLED => 3145966

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ENCRYPTIONBLT_DST_NOT_STAGING => 3145967

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ENCRYPTIONBLT_SRC_MAPPED => 3145968

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ENCRYPTIONBLT_DST_MAPPED => 3145969

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ENCRYPTIONBLT_SRC_OFFERED => 3145970

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ENCRYPTIONBLT_DST_OFFERED => 3145971

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ENCRYPTIONBLT_SRC_CONTENT_UNDEFINED => 3145972

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECRYPTIONBLT_UNSUPPORTED => 3145973

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECRYPTIONBLT_NULLPARAM => 3145974

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECRYPTIONBLT_SRC_WRONGDEVICE => 3145975

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECRYPTIONBLT_DST_WRONGDEVICE => 3145976

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECRYPTIONBLT_FORMAT_MISMATCH => 3145977

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECRYPTIONBLT_SIZE_MISMATCH => 3145978

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECRYPTIONBLT_DST_MULTISAMPLED => 3145979

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECRYPTIONBLT_SRC_NOT_STAGING => 3145980

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECRYPTIONBLT_DST_NOT_RENDER_TARGET => 3145981

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECRYPTIONBLT_SRC_MAPPED => 3145982

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECRYPTIONBLT_DST_MAPPED => 3145983

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECRYPTIONBLT_SRC_OFFERED => 3145984

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECRYPTIONBLT_DST_OFFERED => 3145985

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECRYPTIONBLT_SRC_CONTENT_UNDEFINED => 3145986

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_STARTSESSIONKEYREFRESH_NULLPARAM => 3145987

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_STARTSESSIONKEYREFRESH_INVALIDSIZE => 3145988

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_FINISHSESSIONKEYREFRESH_NULLPARAM => 3145989

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETENCRYPTIONBLTKEY_NULLPARAM => 3145990

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETENCRYPTIONBLTKEY_INVALIDSIZE => 3145991

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETCONTENTPROTECTIONCAPS_NULLPARAM => 3145992

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CHECKCRYPTOKEYEXCHANGE_NULLPARAM => 3145993

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CHECKCRYPTOKEYEXCHANGE_INVALIDINDEX => 3145994

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEAUTHENTICATEDCHANNEL_NULLPARAM => 3145995

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEAUTHENTICATEDCHANNEL_UNSUPPORTED => 3145996

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEAUTHENTICATEDCHANNEL_INVALIDTYPE => 3145997

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEAUTHENTICATEDCHANNEL_OUTOFMEMORY_RETURN => 3145998

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETAUTHENTICATEDCHANNELCERTIFICATESIZE_INVALIDCHANNEL => 3145999

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETAUTHENTICATEDCHANNELCERTIFICATESIZE_NULLPARAM => 3146000

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETAUTHENTICATEDCHANNELCERTIFICATE_INVALIDCHANNEL => 3146001

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETAUTHENTICATEDCHANNELCERTIFICATE_NULLPARAM => 3146002

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETAUTHENTICATEDCHANNELCERTIFICATE_WRONGSIZE => 3146003

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_NEGOTIATEAUTHENTICATEDCHANNELKEYEXCHANGE_INVALIDCHANNEL => 3146004

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_NEGOTIATEAUTHENTICATEDCHANNELKEYEXCHANGE_NULLPARAM => 3146005

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_QUERYAUTHENTICATEDCHANNEL_NULLPARAM => 3146006

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_QUERYAUTHENTICATEDCHANNEL_WRONGCHANNEL => 3146007

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_QUERYAUTHENTICATEDCHANNEL_UNSUPPORTEDQUERY => 3146008

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_QUERYAUTHENTICATEDCHANNEL_WRONGSIZE => 3146009

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_QUERYAUTHENTICATEDCHANNEL_INVALIDPROCESSINDEX => 3146010

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CONFIGUREAUTHENTICATEDCHANNEL_NULLPARAM => 3146011

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CONFIGUREAUTHENTICATEDCHANNEL_WRONGCHANNEL => 3146012

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CONFIGUREAUTHENTICATEDCHANNEL_UNSUPPORTEDCONFIGURE => 3146013

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CONFIGUREAUTHENTICATEDCHANNEL_WRONGSIZE => 3146014

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CONFIGUREAUTHENTICATEDCHANNEL_INVALIDPROCESSIDTYPE => 3146015

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VSSETCONSTANTBUFFERS_INVALIDBUFFEROFFSETORCOUNT => 3146016

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DSSETCONSTANTBUFFERS_INVALIDBUFFEROFFSETORCOUNT => 3146017

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_HSSETCONSTANTBUFFERS_INVALIDBUFFEROFFSETORCOUNT => 3146018

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GSSETCONSTANTBUFFERS_INVALIDBUFFEROFFSETORCOUNT => 3146019

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_PSSETCONSTANTBUFFERS_INVALIDBUFFEROFFSETORCOUNT => 3146020

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CSSETCONSTANTBUFFERS_INVALIDBUFFEROFFSETORCOUNT => 3146021

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_NEGOTIATECRPYTOSESSIONKEYEXCHANGE_INVALIDSIZE => 3146022

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_NEGOTIATEAUTHENTICATEDCHANNELKEYEXCHANGE_INVALIDSIZE => 3146023

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_OFFERRESOURCES_INVALIDPRIORITY => 3146024

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETCRYPTOSESSIONHANDLE_OUTOFMEMORY => 3146025

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ACQUIREHANDLEFORCAPTURE_NULLPARAM => 3146026

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ACQUIREHANDLEFORCAPTURE_INVALIDTYPE => 3146027

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ACQUIREHANDLEFORCAPTURE_INVALIDBIND => 3146028

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ACQUIREHANDLEFORCAPTURE_INVALIDARRAY => 3146029

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMROTATION_NULLPARAM => 3146030

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMROTATION_INVALIDSTREAM => 3146031

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMROTATION_INVALID => 3146032

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMROTATION_UNSUPPORTED => 3146033

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMROTATION_NULLPARAM => 3146034

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CLEARVIEW_INVALIDVIEW => 3146035

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEVERTEXSHADER_DOUBLEEXTENSIONSNOTSUPPORTED => 3146036

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEVERTEXSHADER_SHADEREXTENSIONSNOTSUPPORTED => 3146037

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEHULLSHADER_DOUBLEEXTENSIONSNOTSUPPORTED => 3146038

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEHULLSHADER_SHADEREXTENSIONSNOTSUPPORTED => 3146039

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEDOMAINSHADER_DOUBLEEXTENSIONSNOTSUPPORTED => 3146040

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEDOMAINSHADER_SHADEREXTENSIONSNOTSUPPORTED => 3146041

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEGEOMETRYSHADER_DOUBLEEXTENSIONSNOTSUPPORTED => 3146042

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEGEOMETRYSHADER_SHADEREXTENSIONSNOTSUPPORTED => 3146043

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_DOUBLEEXTENSIONSNOTSUPPORTED => 3146044

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_SHADEREXTENSIONSNOTSUPPORTED => 3146045

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEPIXELSHADER_DOUBLEEXTENSIONSNOTSUPPORTED => 3146046

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEPIXELSHADER_SHADEREXTENSIONSNOTSUPPORTED => 3146047

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATECOMPUTESHADER_DOUBLEEXTENSIONSNOTSUPPORTED => 3146048

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATECOMPUTESHADER_SHADEREXTENSIONSNOTSUPPORTED => 3146049

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SHADER_LINKAGE_MINPRECISION => 3146050

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMALPHA_UNSUPPORTED => 3146051

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMPIXELASPECTRATIO_UNSUPPORTED => 3146052

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEVERTEXSHADER_UAVSNOTSUPPORTED => 3146053

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEHULLSHADER_UAVSNOTSUPPORTED => 3146054

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEDOMAINSHADER_UAVSNOTSUPPORTED => 3146055

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEGEOMETRYSHADER_UAVSNOTSUPPORTED => 3146056

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UAVSNOTSUPPORTED => 3146057

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATEPIXELSHADER_UAVSNOTSUPPORTED => 3146058

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CREATECOMPUTESHADER_UAVSNOTSUPPORTED => 3146059

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_OMSETRENDERTARGETSANDUNORDEREDACCESSVIEWS_INVALIDOFFSET => 3146060

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_OMSETRENDERTARGETSANDUNORDEREDACCESSVIEWS_TOOMANYVIEWS => 3146061

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CLEARVIEW_NOTSUPPORTED => 3146062

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_SWAPDEVICECONTEXTSTATE_NOTSUPPORTED => 3146063

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_UPDATESUBRESOURCE_PREFERUPDATESUBRESOURCE1 => 3146064

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETDC_INACCESSIBLE => 3146065

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CLEARVIEW_INVALIDRECT => 3146066

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_SAMPLE_MASK_IGNORED_ON_FL9 => 3146067

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_OPEN_SHARED_RESOURCE1_NOT_SUPPORTED => 3146068

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_OPEN_SHARED_RESOURCE_BY_NAME_NOT_SUPPORTED => 3146069

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_ENQUEUESETEVENT_NOT_SUPPORTED => 3146070

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_OFFERRELEASE_NOT_SUPPORTED => 3146071

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_OFFERRESOURCES_INACCESSIBLE => 3146072

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSORINPUTVIEW_INVALIDMSAA => 3146073

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEVIDEOPROCESSOROUTPUTVIEW_INVALIDMSAA => 3146074

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CLEARVIEW_INVALIDSOURCERECT => 3146075

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_CLEARVIEW_EMPTYRECT => 3146076

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_UPDATESUBRESOURCE_EMPTYDESTBOX => 3146077

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYSUBRESOURCEREGION_EMPTYSOURCEBOX => 3146078

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_OM_RENDER_TARGET_DOES_NOT_SUPPORT_LOGIC_OPS => 3146079

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_DEPTHSTENCILVIEW_NOT_SET => 3146080

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_RENDERTARGETVIEW_NOT_SET => 3146081

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_RENDERTARGETVIEW_NOT_SET_DUE_TO_FLIP_PRESENT => 3146082

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_UNORDEREDACCESSVIEW_NOT_SET_DUE_TO_FLIP_PRESENT => 3146083

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETDATAFORNEWHARDWAREKEY_NULLPARAM => 3146084

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CHECKCRYPTOSESSIONSTATUS_NULLPARAM => 3146085

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETCRYPTOSESSIONPRIVATEDATASIZE_NULLPARAM => 3146086

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEODECODERCAPS_NULLPARAM => 3146087

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETVIDEODECODERCAPS_ZEROWIDTHHEIGHT => 3146088

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CHECKVIDEODECODERDOWNSAMPLING_NULLPARAM => 3146089

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CHECKVIDEODECODERDOWNSAMPLING_INVALIDCOLORSPACE => 3146090

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CHECKVIDEODECODERDOWNSAMPLING_ZEROWIDTHHEIGHT => 3146091

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEODECODERENABLEDOWNSAMPLING_NULLPARAM => 3146092

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEODECODERENABLEDOWNSAMPLING_UNSUPPORTED => 3146093

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEODECODERUPDATEDOWNSAMPLING_NULLPARAM => 3146094

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEODECODERUPDATEDOWNSAMPLING_UNSUPPORTED => 3146095

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CHECKVIDEOPROCESSORFORMATCONVERSION_NULLPARAM => 3146096

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTCOLORSPACE1_NULLPARAM => 3146097

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETOUTPUTCOLORSPACE1_NULLPARAM => 3146098

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMCOLORSPACE1_NULLPARAM => 3146099

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMCOLORSPACE1_INVALIDSTREAM => 3146100

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMMIRROR_NULLPARAM => 3146101

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMMIRROR_INVALIDSTREAM => 3146102

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMMIRROR_UNSUPPORTED => 3146103

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMCOLORSPACE1_NULLPARAM => 3146104

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMMIRROR_NULLPARAM => 3146105

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RECOMMENDVIDEODECODERDOWNSAMPLING_NULLPARAM => 3146106

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RECOMMENDVIDEODECODERDOWNSAMPLING_INVALIDCOLORSPACE => 3146107

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RECOMMENDVIDEODECODERDOWNSAMPLING_ZEROWIDTHHEIGHT => 3146108

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTSHADERUSAGE_NULLPARAM => 3146109

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETOUTPUTSHADERUSAGE_NULLPARAM => 3146110

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETBEHAVIORHINTS_NULLPARAM => 3146111

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETBEHAVIORHINTS_INVALIDSTREAMCOUNT => 3146112

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETBEHAVIORHINTS_TARGETRECT => 3146113

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETBEHAVIORHINTS_INVALIDSOURCERECT => 3146114

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETBEHAVIORHINTS_INVALIDDESTRECT => 3146115

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETCRYPTOSESSIONPRIVATEDATASIZE_INVALID_KEY_EXCHANGE_TYPE => 3146116

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_OPEN_SHARED_RESOURCE1_ACCESS_DENIED => 3146117

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_D3D11_1_MESSAGES_END => 3146118

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_D3D11_2_MESSAGES_START => 3146119

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEBUFFER_INVALIDUSAGE => 3146120

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE1D_INVALIDUSAGE => 3146121

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATETEXTURE2D_INVALIDUSAGE => 3146122

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_LEVEL9_STEPRATE_NOT_1 => 3146123

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEINPUTLAYOUT_LEVEL9_INSTANCING_NOT_SUPPORTED => 3146124

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_UPDATETILEMAPPINGS_INVALID_PARAMETER => 3146125

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYTILEMAPPINGS_INVALID_PARAMETER => 3146126

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_COPYTILES_INVALID_PARAMETER => 3146127

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_UPDATETILES_INVALID_PARAMETER => 3146128

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RESIZETILEPOOL_INVALID_PARAMETER => 3146129

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TILEDRESOURCEBARRIER_INVALID_PARAMETER => 3146130

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_NULL_TILE_MAPPING_ACCESS_WARNING => 3146131

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_NULL_TILE_MAPPING_ACCESS_ERROR => 3146132

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DIRTY_TILE_MAPPING_ACCESS => 3146133

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DUPLICATE_TILE_MAPPINGS_IN_COVERED_AREA => 3146134

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TILE_MAPPINGS_IN_COVERED_AREA_DUPLICATED_OUTSIDE => 3146135

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TILE_MAPPINGS_SHARED_BETWEEN_INCOMPATIBLE_RESOURCES => 3146136

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TILE_MAPPINGS_SHARED_BETWEEN_INPUT_AND_OUTPUT => 3146137

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CHECKMULTISAMPLEQUALITYLEVELS_INVALIDFLAGS => 3146138

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_GETRESOURCETILING_NONTILED_RESOURCE => 3146139

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_RESIZETILEPOOL_SHRINK_WITH_MAPPINGS_STILL_DEFINED_PAST_END => 3146140

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_NEED_TO_CALL_TILEDRESOURCEBARRIER => 3146141

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEVICE_INVALIDARGS => 3146142

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEDEVICE_WARNING => 3146143

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CLEARUNORDEREDACCESSVIEWUINT_HAZARD => 3146144

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CLEARUNORDEREDACCESSVIEWFLOAT_HAZARD => 3146145

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TILED_RESOURCE_TIER_1_BUFFER_TEXTURE_MISMATCH => 3146146

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_CRYPTOSESSION => 3146147

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_AUTHENTICATEDCHANNEL => 3146148

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_CRYPTOSESSION => 3146149

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_AUTHENTICATEDCHANNEL => 3146150

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_CRYPTOSESSION => 3146151

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_AUTHENTICATEDCHANNEL => 3146152

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_D3D11_2_MESSAGES_END => 3146153

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_D3D11_3_MESSAGES_START => 3146154

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERASTERIZERSTATE_INVALID_CONSERVATIVERASTERMODE => 3146155

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_INVALID_SYSTEMVALUE => 3146156

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEQUERYORPREDICATE_INVALIDCONTEXTTYPE => 3146157

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEQUERYORPREDICATE_DECODENOTSUPPORTED => 3146158

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEQUERYORPREDICATE_ENCODENOTSUPPORTED => 3146159

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDPLANEINDEX => 3146160

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDVIDEOPLANEINDEX => 3146161

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATESHADERRESOURCEVIEW_AMBIGUOUSVIDEOPLANEINDEX => 3146162

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDPLANEINDEX => 3146163

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDVIDEOPLANEINDEX => 3146164

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATERENDERTARGETVIEW_AMBIGUOUSVIDEOPLANEINDEX => 3146165

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_INVALIDPLANEINDEX => 3146166

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_INVALIDVIDEOPLANEINDEX => 3146167

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_AMBIGUOUSVIDEOPLANEINDEX => 3146168

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_INVALIDSCANDATAOFFSET => 3146169

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_NOTSUPPORTED => 3146170

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_DIMENSIONSTOOLARGE => 3146171

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_INVALIDCOMPONENTS => 3146172

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_DESTINATIONNOT2D => 3146173

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_TILEDRESOURCESUNSUPPORTED => 3146174

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_GUARDRECTSUNSUPPORTED => 3146175

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_FORMATUNSUPPORTED => 3146176

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_INVALIDSUBRESOURCE => 3146177

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_INVALIDMIPLEVEL => 3146178

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_EMPTYDESTBOX => 3146179

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_DESTBOXNOT2D => 3146180

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_DESTBOXNOTSUB => 3146181

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_DESTBOXESINTERSECT => 3146182

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_XSUBSAMPLEMISMATCH => 3146183

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_YSUBSAMPLEMISMATCH => 3146184

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_XSUBSAMPLEODD => 3146185

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_YSUBSAMPLEODD => 3146186

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_OUTPUTDIMENSIONSTOOLARGE => 3146187

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_NONPOW2SCALEUNSUPPORTED => 3146188

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_FRACTIONALDOWNSCALETOLARGE => 3146189

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_CHROMASIZEMISMATCH => 3146190

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_LUMACHROMASIZEMISMATCH => 3146191

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_INVALIDNUMDESTINATIONS => 3146192

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_SUBBOXUNSUPPORTED => 3146193

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_1DESTUNSUPPORTEDFORMAT => 3146194

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_3DESTUNSUPPORTEDFORMAT => 3146195

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_SCALEUNSUPPORTED => 3146196

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_INVALIDSOURCESIZE => 3146197

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_INVALIDCOPYFLAGS => 3146198

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_HAZARD => 3146199

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_UNSUPPORTEDSRCBUFFERUSAGE => 3146200

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_UNSUPPORTEDSRCBUFFERMISCFLAGS => 3146201

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_UNSUPPORTEDDSTTEXTUREUSAGE => 3146202

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_BACKBUFFERNOTSUPPORTED => 3146203

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGDECODE_UNSUPPRTEDCOPYFLAGS => 3146204

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGENCODE_NOTSUPPORTED => 3146205

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGENCODE_INVALIDSCANDATAOFFSET => 3146206

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGENCODE_INVALIDCOMPONENTS => 3146207

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGENCODE_SOURCENOT2D => 3146208

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGENCODE_TILEDRESOURCESUNSUPPORTED => 3146209

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGENCODE_GUARDRECTSUNSUPPORTED => 3146210

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGENCODE_XSUBSAMPLEMISMATCH => 3146211

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGENCODE_YSUBSAMPLEMISMATCH => 3146212

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGENCODE_FORMATUNSUPPORTED => 3146213

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGENCODE_INVALIDSUBRESOURCE => 3146214

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGENCODE_INVALIDMIPLEVEL => 3146215

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGENCODE_DIMENSIONSTOOLARGE => 3146216

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGENCODE_HAZARD => 3146217

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGENCODE_UNSUPPORTEDDSTBUFFERUSAGE => 3146218

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGENCODE_UNSUPPORTEDDSTBUFFERMISCFLAGS => 3146219

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGENCODE_UNSUPPORTEDSRCTEXTUREUSAGE => 3146220

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_JPEGENCODE_BACKBUFFERNOTSUPPORTED => 3146221

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEQUERYORPREDICATE_UNSUPPORTEDCONTEXTTTYPEFORQUERY => 3146222

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_FLUSH1_INVALIDCONTEXTTYPE => 3146223

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_SETHARDWAREPROTECTION_INVALIDCONTEXT => 3146224

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTHDRMETADATA_NULLPARAM => 3146225

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETOUTPUTHDRMETADATA_INVALIDSIZE => 3146226

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETOUTPUTHDRMETADATA_NULLPARAM => 3146227

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETOUTPUTHDRMETADATA_INVALIDSIZE => 3146228

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMHDRMETADATA_NULLPARAM => 3146229

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMHDRMETADATA_INVALIDSTREAM => 3146230

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORSETSTREAMHDRMETADATA_INVALIDSIZE => 3146231

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMHDRMETADATA_NULLPARAM => 3146232

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMHDRMETADATA_INVALIDSTREAM => 3146233

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMHDRMETADATA_INVALIDSIZE => 3146234

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMFRAMEFORMAT_INVALIDSTREAM => 3146235

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMCOLORSPACE_INVALIDSTREAM => 3146236

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMOUTPUTRATE_INVALIDSTREAM => 3146237

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMSOURCERECT_INVALIDSTREAM => 3146238

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMDESTRECT_INVALIDSTREAM => 3146239

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMALPHA_INVALIDSTREAM => 3146240

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMPALETTE_INVALIDSTREAM => 3146241

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMPIXELASPECTRATIO_INVALIDSTREAM => 3146242

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMLUMAKEY_INVALIDSTREAM => 3146243

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMSTEREOFORMAT_INVALIDSTREAM => 3146244

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMAUTOPROCESSINGMODE_INVALIDSTREAM => 3146245

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMFILTER_INVALIDSTREAM => 3146246

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMROTATION_INVALIDSTREAM => 3146247

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMCOLORSPACE1_INVALIDSTREAM => 3146248

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_VIDEOPROCESSORGETSTREAMMIRROR_INVALIDSTREAM => 3146249

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_FENCE => 3146250

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_FENCE => 3146251

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_FENCE => 3146252

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_SYNCHRONIZEDCHANNEL => 3146253

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_SYNCHRONIZEDCHANNEL => 3146254

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_SYNCHRONIZEDCHANNEL => 3146255

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATEFENCE_INVALIDFLAGS => 3146256

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_D3D11_3_MESSAGES_END => 3146257

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_D3D11_5_MESSAGES_START => 3146258

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_NEGOTIATECRYPTOSESSIONKEYEXCHANGEMT_INVALIDKEYEXCHANGETYPE => 3146259

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_NEGOTIATECRYPTOSESSIONKEYEXCHANGEMT_NOT_SUPPORTED => 3146260

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECODERBEGINFRAME_INVALID_HISTOGRAM_COMPONENT_COUNT => 3146261

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECODERBEGINFRAME_INVALID_HISTOGRAM_COMPONENT => 3146262

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECODERBEGINFRAME_INVALID_HISTOGRAM_BUFFER_SIZE => 3146263

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECODERBEGINFRAME_INVALID_HISTOGRAM_BUFFER_USAGE => 3146264

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECODERBEGINFRAME_INVALID_HISTOGRAM_BUFFER_MISC_FLAGS => 3146265

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DECODERBEGINFRAME_INVALID_HISTOGRAM_BUFFER_OFFSET => 3146266

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_TRACKEDWORKLOAD => 3146267

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_LIVE_TRACKEDWORKLOAD => 3146268

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DESTROY_TRACKEDWORKLOAD => 3146269

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_TRACKED_WORKLOAD_NULLPARAM => 3146270

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_TRACKED_WORKLOAD_INVALID_MAX_INSTANCES => 3146271

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_TRACKED_WORKLOAD_INVALID_DEADLINE_TYPE => 3146272

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CREATE_TRACKED_WORKLOAD_INVALID_ENGINE_TYPE => 3146273

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_MULTIPLE_TRACKED_WORKLOADS => 3146274

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_MULTIPLE_TRACKED_WORKLOAD_PAIRS => 3146275

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_INCOMPLETE_TRACKED_WORKLOAD_PAIR => 3146276

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_OUT_OF_ORDER_TRACKED_WORKLOAD_PAIR => 3146277

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_CANNOT_ADD_TRACKED_WORKLOAD => 3146278

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TRACKED_WORKLOAD_NOT_SUPPORTED => 3146279

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TRACKED_WORKLOAD_ENGINE_TYPE_NOT_FOUND => 3146280

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_NO_TRACKED_WORKLOAD_SLOT_AVAILABLE => 3146281

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_END_TRACKED_WORKLOAD_INVALID_ARG => 3146282

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_TRACKED_WORKLOAD_DISJOINT_FAILURE => 3146283

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_DEVICE_DRAW_RESOURCE_FORMAT_AND_WRITE_MASK_MISMATCH => 3146284

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_ID_D3D11_5_MESSAGES_END => 3146285
}
