# Chocolatey Package for TupiTube Desk

Chocolatey package for TupiTube Desk - A 2D animation tool designed for children and schools to learn animation basics.

## Package Information

- **Package Name**: tupitube
- **Software**: TupiTube Desk  
- **Publisher**: Utopian Lab LLC
- **Software License**: GPL-2.0
- **Package License**: MIT

## Installation

```powershell
choco install tupitube
```

## Description

TupiTube Desk is a free and open-source 2D animation tool designed to introduce children and teenagers to the world of animation in an easy and fun way. This software provides:

- Simple interface suitable for beginners
- Multiple animation techniques  
- Educational resources for classrooms
- Tools for both desktop and mobile devices

Perfect for schools, educators, and young aspiring animators.

## Package Details

- **Automatic Installation**: Silent MSI installation
- **Automatic Uninstallation**: Clean removal via MSI
- **Checksum Verification**: SHA256 validation for security
- **64-bit Support**: Native 64-bit installer

## Package Maintenance

### Building the Package

```powershell
choco pack
```

### Testing Locally

```powershell
choco install tupitube -s . -f
choco uninstall tupitube -f
```

### File Structure

```
tupitube/
├── tupitube.nuspec
└── tools/
    ├── chocolateyInstall.ps1
    ├── chocolateyUninstall.ps1
    ├── LICENSE.txt
    └── VERIFICATION.txt
```

## Verification

See VERIFICATION.txt for instructions on manually verifying the installation and authenticity of the software.

## Links

- TupiTube Official Website: https://tupitube.com/
- TupiTube Source Code: https://github.com/utopianlabco/tupitube.desk
- Chocolatey Package Page: https://community.chocolatey.org/packages/tupitube

## Issues

- **Package Issues**: Report package-related issues in this repository
- **Software Issues**: Report TupiTube software issues on the official repository: https://github.com/utopianlabco/tupitube.desk/issues	
	
## License

The Chocolatey packaging scripts are licensed under the MIT License (see LICENSE.txt).  
The TupiTube Desk software itself is licensed under GPL-2.0.

## Maintenance

This package is maintained by the community. If you encounter any issues with the package, please open an issue in this repository.

## Contributing

Contributions to improve the package are welcome! Please feel free to submit pull requests or open issues for discussion.